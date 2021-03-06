class ShowsController < ApplicationController
  before_action :current_user_must_be_show_users, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_show_users
    show = Show.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == show.users
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Show.ransack(params[:q])
    @shows = @q.result(:distinct => true).includes(:users, :likes).page(params[:page]).per(10)

    render("show_templates/index.html.erb")
  end

  def show
    @like = Like.new
    @show = Show.find(params.fetch("id_to_display"))

    render("show_templates/show.html.erb")
  end

  def new_form
    @show = Show.new

    render("show_templates/new_form.html.erb")
  end

  def create_row
    @show = Show.new

    @show.title = params.fetch("title")
    @show.source = params.fetch("source")
    @show.users_id = params.fetch("users_id")
    @show.genre_topic = params.fetch("genre_topic")
    @show.description = params.fetch("description")
    @show.comments = params.fetch("comments")

    if @show.valid?
      @show.save

      redirect_back(:fallback_location => "/shows", :notice => "Show created successfully.")
    else
      render("show_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @show = Show.find(params.fetch("prefill_with_id"))

    render("show_templates/edit_form.html.erb")
  end

  def update_row
    @show = Show.find(params.fetch("id_to_modify"))

    @show.title = params.fetch("title")
    @show.source = params.fetch("source")
    
    @show.genre_topic = params.fetch("genre_topic")
    @show.description = params.fetch("description")
    @show.comments = params.fetch("comments")

    if @show.valid?
      @show.save

      redirect_to("/shows/#{@show.id}", :notice => "Show updated successfully.")
    else
      render("show_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_users
    @show = Show.find(params.fetch("id_to_remove"))

    @show.destroy

    redirect_to("/users/#{@show.users_id}", notice: "Show deleted successfully.")
  end

  def destroy_row
    @show = Show.find(params.fetch("id_to_remove"))

    @show.destroy

    redirect_to("/shows", :notice => "Show deleted successfully.")
  end
end

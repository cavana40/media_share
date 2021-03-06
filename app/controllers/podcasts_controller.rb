class PodcastsController < ApplicationController
  before_action :current_user_must_be_podcast_users, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_podcast_users
    podcast = Podcast.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == podcast.users
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Podcast.ransack(params[:q])
    @podcasts = @q.result(:distinct => true).includes(:users, :likes).page(params[:page]).per(10)

    render("podcast_templates/index.html.erb")
  end

  def show
    @like = Like.new
    @podcast = Podcast.find(params.fetch("id_to_display"))

    render("podcast_templates/show.html.erb")
  end

  def new_form
    @podcast = Podcast.new

    render("podcast_templates/new_form.html.erb")
  end

  def create_row
    @podcast = Podcast.new

    @podcast.title = params.fetch("title")
    @podcast.source = params.fetch("source")
    @podcast.favorite_episode = params.fetch("favorite_episode")
    @podcast.users_id = params.fetch("users_id")
    @podcast.genre_topic = params.fetch("genre_topic")
    @podcast.description = params.fetch("description")
    @podcast.comments = params.fetch("comments")

    if @podcast.valid?
      @podcast.save

      redirect_back(:fallback_location => "/podcasts", :notice => "Podcast created successfully.")
    else
      render("podcast_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @podcast = Podcast.find(params.fetch("prefill_with_id"))

    render("podcast_templates/edit_form.html.erb")
  end

  def update_row
    @podcast = Podcast.find(params.fetch("id_to_modify"))

    @podcast.title = params.fetch("title")
    @podcast.source = params.fetch("source")
    @podcast.favorite_episode = params.fetch("favorite_episode")
    
    @podcast.genre_topic = params.fetch("genre_topic")
    @podcast.description = params.fetch("description")
    @podcast.comments = params.fetch("comments")

    if @podcast.valid?
      @podcast.save

      redirect_to("/podcasts/#{@podcast.id}", :notice => "Podcast updated successfully.")
    else
      render("podcast_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_users
    @podcast = Podcast.find(params.fetch("id_to_remove"))

    @podcast.destroy

    redirect_to("/users/#{@podcast.users_id}", notice: "Podcast deleted successfully.")
  end

  def destroy_row
    @podcast = Podcast.find(params.fetch("id_to_remove"))

    @podcast.destroy

    redirect_to("/podcasts", :notice => "Podcast deleted successfully.")
  end
end

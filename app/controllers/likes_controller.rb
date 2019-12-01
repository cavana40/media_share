class LikesController < ApplicationController
  def index
    @likes = Like.all

    render("like_templates/index.html.erb")
  end

  def show
    @like = Like.find(params.fetch("id_to_display"))

    render("like_templates/show.html.erb")
  end

  def new_form
    @like = Like.new

    render("like_templates/new_form.html.erb")
  end

  def create_row
    @like = Like.new

    @like.users_id = params.fetch("users_id")
    @like.films_id = params.fetch("films_id")
    @like.shows_id = params.fetch("shows_id")
    @like.podcasts_id = params.fetch("podcasts_id")
    @like.articles_id = params.fetch("articles_id")
    @like.books_id = params.fetch("books_id")

    if @like.valid?
      @like.save

      redirect_back(:fallback_location => "/likes", :notice => "Like created successfully.")
    else
      render("like_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @like = Like.find(params.fetch("prefill_with_id"))

    render("like_templates/edit_form.html.erb")
  end

  def update_row
    @like = Like.find(params.fetch("id_to_modify"))

    @like.users_id = params.fetch("users_id")
    @like.films_id = params.fetch("films_id")
    @like.shows_id = params.fetch("shows_id")
    @like.podcasts_id = params.fetch("podcasts_id")
    @like.articles_id = params.fetch("articles_id")
    @like.books_id = params.fetch("books_id")

    if @like.valid?
      @like.save

      redirect_to("/likes/#{@like.id}", :notice => "Like updated successfully.")
    else
      render("like_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @like = Like.find(params.fetch("id_to_remove"))

    @like.destroy

    redirect_to("/likes", :notice => "Like deleted successfully.")
  end
end

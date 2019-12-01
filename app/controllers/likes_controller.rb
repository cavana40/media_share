class LikesController < ApplicationController
  before_action :current_user_must_be_like_users, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_like_users
    like = Like.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == like.users
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @likes = Like.page(params[:page]).per(10)

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

  def create_row_from_book
    @like = Like.new

    @like.users_id = params.fetch("users_id")
    @like.films_id = params.fetch("films_id")
    @like.shows_id = params.fetch("shows_id")
    @like.podcasts_id = params.fetch("podcasts_id")
    @like.articles_id = params.fetch("articles_id")
    @like.books_id = params.fetch("books_id")

    if @like.valid?
      @like.save

      redirect_to("/books/#{@like.books_id}", notice: "Like created successfully.")
    else
      render("like_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_show
    @like = Like.new

    @like.users_id = params.fetch("users_id")
    @like.films_id = params.fetch("films_id")
    @like.shows_id = params.fetch("shows_id")
    @like.podcasts_id = params.fetch("podcasts_id")
    @like.articles_id = params.fetch("articles_id")
    @like.books_id = params.fetch("books_id")

    if @like.valid?
      @like.save

      redirect_to("/shows/#{@like.shows_id}", notice: "Like created successfully.")
    else
      render("like_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_article
    @like = Like.new

    @like.users_id = params.fetch("users_id")
    @like.films_id = params.fetch("films_id")
    @like.shows_id = params.fetch("shows_id")
    @like.podcasts_id = params.fetch("podcasts_id")
    @like.articles_id = params.fetch("articles_id")
    @like.books_id = params.fetch("books_id")

    if @like.valid?
      @like.save

      redirect_to("/articles/#{@like.articles_id}", notice: "Like created successfully.")
    else
      render("like_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_podcast
    @like = Like.new

    @like.users_id = params.fetch("users_id")
    @like.films_id = params.fetch("films_id")
    @like.shows_id = params.fetch("shows_id")
    @like.podcasts_id = params.fetch("podcasts_id")
    @like.articles_id = params.fetch("articles_id")
    @like.books_id = params.fetch("books_id")

    if @like.valid?
      @like.save

      redirect_to("/podcasts/#{@like.podcasts_id}", notice: "Like created successfully.")
    else
      render("like_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_film
    @like = Like.new

    @like.users_id = params.fetch("users_id")
    @like.films_id = params.fetch("films_id")
    @like.shows_id = params.fetch("shows_id")
    @like.podcasts_id = params.fetch("podcasts_id")
    @like.articles_id = params.fetch("articles_id")
    @like.books_id = params.fetch("books_id")

    if @like.valid?
      @like.save

      redirect_to("/films/#{@like.films_id}", notice: "Like created successfully.")
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

  def destroy_row_from_users
    @like = Like.find(params.fetch("id_to_remove"))

    @like.destroy

    redirect_to("/users/#{@like.users_id}", notice: "Like deleted successfully.")
  end

  def destroy_row_from_books
    @like = Like.find(params.fetch("id_to_remove"))

    @like.destroy

    redirect_to("/books/#{@like.books_id}", notice: "Like deleted successfully.")
  end

  def destroy_row_from_shows
    @like = Like.find(params.fetch("id_to_remove"))

    @like.destroy

    redirect_to("/shows/#{@like.shows_id}", notice: "Like deleted successfully.")
  end

  def destroy_row_from_articles
    @like = Like.find(params.fetch("id_to_remove"))

    @like.destroy

    redirect_to("/articles/#{@like.articles_id}", notice: "Like deleted successfully.")
  end

  def destroy_row_from_podcasts
    @like = Like.find(params.fetch("id_to_remove"))

    @like.destroy

    redirect_to("/podcasts/#{@like.podcasts_id}", notice: "Like deleted successfully.")
  end

  def destroy_row_from_films
    @like = Like.find(params.fetch("id_to_remove"))

    @like.destroy

    redirect_to("/films/#{@like.films_id}", notice: "Like deleted successfully.")
  end

  def destroy_row
    @like = Like.find(params.fetch("id_to_remove"))

    @like.destroy

    redirect_to("/likes", :notice => "Like deleted successfully.")
  end
end

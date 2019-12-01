class FilmsController < ApplicationController
  def index
    @films = Film.all

    render("film_templates/index.html.erb")
  end

  def show
    @film = Film.find(params.fetch("id_to_display"))

    render("film_templates/show.html.erb")
  end

  def new_form
    @film = Film.new

    render("film_templates/new_form.html.erb")
  end

  def create_row
    @film = Film.new

    @film.title = params.fetch("title")
    @film.source = params.fetch("source")
    @film.users_id = params.fetch("users_id")
    @film.genre_topic = params.fetch("genre_topic")
    @film.description = params.fetch("description")
    @film.comments = params.fetch("comments")

    if @film.valid?
      @film.save

      redirect_back(:fallback_location => "/films", :notice => "Film created successfully.")
    else
      render("film_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @film = Film.find(params.fetch("prefill_with_id"))

    render("film_templates/edit_form.html.erb")
  end

  def update_row
    @film = Film.find(params.fetch("id_to_modify"))

    @film.title = params.fetch("title")
    @film.source = params.fetch("source")
    @film.users_id = params.fetch("users_id")
    @film.genre_topic = params.fetch("genre_topic")
    @film.description = params.fetch("description")
    @film.comments = params.fetch("comments")

    if @film.valid?
      @film.save

      redirect_to("/films/#{@film.id}", :notice => "Film updated successfully.")
    else
      render("film_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @film = Film.find(params.fetch("id_to_remove"))

    @film.destroy

    redirect_to("/films", :notice => "Film deleted successfully.")
  end
end
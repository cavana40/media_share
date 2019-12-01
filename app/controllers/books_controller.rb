class BooksController < ApplicationController
  before_action :current_user_must_be_book_users, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_book_users
    book = Book.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == book.users
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(:distinct => true).includes(:users, :likes).page(params[:page]).per(10)

    render("book_templates/index.html.erb")
  end

  def show
    @like = Like.new
    @book = Book.find(params.fetch("id_to_display"))

    render("book_templates/show.html.erb")
  end

  def new_form
    @book = Book.new

    render("book_templates/new_form.html.erb")
  end

  def create_row
    @book = Book.new

    @book.title = params.fetch("title")
    @book.author = params.fetch("author")
    @book.description = params.fetch("description")
    @book.users_id = params.fetch("users_id")
    @book.genre_topic = params.fetch("genre_topic")
    @book.comments = params.fetch("comments")

    if @book.valid?
      @book.save

      redirect_back(:fallback_location => "/books", :notice => "Book created successfully.")
    else
      render("book_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @book = Book.find(params.fetch("prefill_with_id"))

    render("book_templates/edit_form.html.erb")
  end

  def update_row
    @book = Book.find(params.fetch("id_to_modify"))

    @book.title = params.fetch("title")
    @book.author = params.fetch("author")
    @book.description = params.fetch("description")
    
    @book.genre_topic = params.fetch("genre_topic")
    @book.comments = params.fetch("comments")

    if @book.valid?
      @book.save

      redirect_to("/books/#{@book.id}", :notice => "Book updated successfully.")
    else
      render("book_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_users
    @book = Book.find(params.fetch("id_to_remove"))

    @book.destroy

    redirect_to("/users/#{@book.users_id}", notice: "Book deleted successfully.")
  end

  def destroy_row
    @book = Book.find(params.fetch("id_to_remove"))

    @book.destroy

    redirect_to("/books", :notice => "Book deleted successfully.")
  end
end

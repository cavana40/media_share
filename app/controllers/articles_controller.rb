class ArticlesController < ApplicationController
  def index
    @articles = Article.all

    render("article_templates/index.html.erb")
  end

  def show
    @like = Like.new
    @article = Article.find(params.fetch("id_to_display"))

    render("article_templates/show.html.erb")
  end

  def new_form
    @article = Article.new

    render("article_templates/new_form.html.erb")
  end

  def create_row
    @article = Article.new

    @article.title = params.fetch("title")
    @article.author = params.fetch("author")
    @article.link = params.fetch("link")
    @article.users_id = params.fetch("users_id")
    @article.genre_topic = params.fetch("genre_topic")
    @article.description = params.fetch("description")
    @article.comments = params.fetch("comments")

    if @article.valid?
      @article.save

      redirect_back(:fallback_location => "/articles", :notice => "Article created successfully.")
    else
      render("article_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @article = Article.find(params.fetch("prefill_with_id"))

    render("article_templates/edit_form.html.erb")
  end

  def update_row
    @article = Article.find(params.fetch("id_to_modify"))

    @article.title = params.fetch("title")
    @article.author = params.fetch("author")
    @article.link = params.fetch("link")
    @article.users_id = params.fetch("users_id")
    @article.genre_topic = params.fetch("genre_topic")
    @article.description = params.fetch("description")
    @article.comments = params.fetch("comments")

    if @article.valid?
      @article.save

      redirect_to("/articles/#{@article.id}", :notice => "Article updated successfully.")
    else
      render("article_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_users
    @article = Article.find(params.fetch("id_to_remove"))

    @article.destroy

    redirect_to("/users/#{@article.users_id}", notice: "Article deleted successfully.")
  end

  def destroy_row
    @article = Article.find(params.fetch("id_to_remove"))

    @article.destroy

    redirect_to("/articles", :notice => "Article deleted successfully.")
  end
end

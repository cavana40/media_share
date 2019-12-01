Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "books#index"
  # Routes for the Follow request resource:

  # CREATE
  get("/follow_requests/new", { :controller => "follow_requests", :action => "new_form" })
  post("/create_follow_request", { :controller => "follow_requests", :action => "create_row" })

  # READ
  get("/follow_requests", { :controller => "follow_requests", :action => "index" })
  get("/follow_requests/:id_to_display", { :controller => "follow_requests", :action => "show" })

  # UPDATE
  get("/follow_requests/:prefill_with_id/edit", { :controller => "follow_requests", :action => "edit_form" })
  post("/update_follow_request/:id_to_modify", { :controller => "follow_requests", :action => "update_row" })

  # DELETE
  get("/delete_follow_request/:id_to_remove", { :controller => "follow_requests", :action => "destroy_row" })
  get("/delete_follow_request_from_sender/:id_to_remove", { :controller => "follow_requests", :action => "destroy_row_from_sender" })

  #------------------------------

  # Routes for the Like resource:

  # CREATE
  get("/likes/new", { :controller => "likes", :action => "new_form" })
  post("/create_like", { :controller => "likes", :action => "create_row" })
  post("/create_like_from_film", { :controller => "likes", :action => "create_row_from_film" })
  post("/create_like_from_podcast", { :controller => "likes", :action => "create_row_from_podcast" })
  post("/create_like_from_article", { :controller => "likes", :action => "create_row_from_article" })
  post("/create_like_from_show", { :controller => "likes", :action => "create_row_from_show" })
  post("/create_like_from_book", { :controller => "likes", :action => "create_row_from_book" })

  # READ
  get("/likes", { :controller => "likes", :action => "index" })
  get("/likes/:id_to_display", { :controller => "likes", :action => "show" })

  # UPDATE
  get("/likes/:prefill_with_id/edit", { :controller => "likes", :action => "edit_form" })
  post("/update_like/:id_to_modify", { :controller => "likes", :action => "update_row" })

  # DELETE
  get("/delete_like/:id_to_remove", { :controller => "likes", :action => "destroy_row" })
  get("/delete_like_from_films/:id_to_remove", { :controller => "likes", :action => "destroy_row_from_films" })
  get("/delete_like_from_podcasts/:id_to_remove", { :controller => "likes", :action => "destroy_row_from_podcasts" })
  get("/delete_like_from_articles/:id_to_remove", { :controller => "likes", :action => "destroy_row_from_articles" })
  get("/delete_like_from_shows/:id_to_remove", { :controller => "likes", :action => "destroy_row_from_shows" })
  get("/delete_like_from_books/:id_to_remove", { :controller => "likes", :action => "destroy_row_from_books" })
  get("/delete_like_from_users/:id_to_remove", { :controller => "likes", :action => "destroy_row_from_users" })

  #------------------------------

  # Routes for the Film resource:

  # CREATE
  get("/films/new", { :controller => "films", :action => "new_form" })
  post("/create_film", { :controller => "films", :action => "create_row" })

  # READ
  get("/films", { :controller => "films", :action => "index" })
  get("/films/:id_to_display", { :controller => "films", :action => "show" })

  # UPDATE
  get("/films/:prefill_with_id/edit", { :controller => "films", :action => "edit_form" })
  post("/update_film/:id_to_modify", { :controller => "films", :action => "update_row" })

  # DELETE
  get("/delete_film/:id_to_remove", { :controller => "films", :action => "destroy_row" })
  get("/delete_film_from_users/:id_to_remove", { :controller => "films", :action => "destroy_row_from_users" })

  #------------------------------

  # Routes for the Podcast resource:

  # CREATE
  get("/podcasts/new", { :controller => "podcasts", :action => "new_form" })
  post("/create_podcast", { :controller => "podcasts", :action => "create_row" })

  # READ
  get("/podcasts", { :controller => "podcasts", :action => "index" })
  get("/podcasts/:id_to_display", { :controller => "podcasts", :action => "show" })

  # UPDATE
  get("/podcasts/:prefill_with_id/edit", { :controller => "podcasts", :action => "edit_form" })
  post("/update_podcast/:id_to_modify", { :controller => "podcasts", :action => "update_row" })

  # DELETE
  get("/delete_podcast/:id_to_remove", { :controller => "podcasts", :action => "destroy_row" })
  get("/delete_podcast_from_users/:id_to_remove", { :controller => "podcasts", :action => "destroy_row_from_users" })

  #------------------------------

  # Routes for the Article resource:

  # CREATE
  get("/articles/new", { :controller => "articles", :action => "new_form" })
  post("/create_article", { :controller => "articles", :action => "create_row" })

  # READ
  get("/articles", { :controller => "articles", :action => "index" })
  get("/articles/:id_to_display", { :controller => "articles", :action => "show" })

  # UPDATE
  get("/articles/:prefill_with_id/edit", { :controller => "articles", :action => "edit_form" })
  post("/update_article/:id_to_modify", { :controller => "articles", :action => "update_row" })

  # DELETE
  get("/delete_article/:id_to_remove", { :controller => "articles", :action => "destroy_row" })
  get("/delete_article_from_users/:id_to_remove", { :controller => "articles", :action => "destroy_row_from_users" })

  #------------------------------

  # Routes for the Show resource:

  # CREATE
  get("/shows/new", { :controller => "shows", :action => "new_form" })
  post("/create_show", { :controller => "shows", :action => "create_row" })

  # READ
  get("/shows", { :controller => "shows", :action => "index" })
  get("/shows/:id_to_display", { :controller => "shows", :action => "show" })

  # UPDATE
  get("/shows/:prefill_with_id/edit", { :controller => "shows", :action => "edit_form" })
  post("/update_show/:id_to_modify", { :controller => "shows", :action => "update_row" })

  # DELETE
  get("/delete_show/:id_to_remove", { :controller => "shows", :action => "destroy_row" })
  get("/delete_show_from_users/:id_to_remove", { :controller => "shows", :action => "destroy_row_from_users" })

  #------------------------------

  # Routes for the Book resource:

  # CREATE
  get("/books/new", { :controller => "books", :action => "new_form" })
  post("/create_book", { :controller => "books", :action => "create_row" })

  # READ
  get("/books", { :controller => "books", :action => "index" })
  get("/books/:id_to_display", { :controller => "books", :action => "show" })

  # UPDATE
  get("/books/:prefill_with_id/edit", { :controller => "books", :action => "edit_form" })
  post("/update_book/:id_to_modify", { :controller => "books", :action => "update_row" })

  # DELETE
  get("/delete_book/:id_to_remove", { :controller => "books", :action => "destroy_row" })
  get("/delete_book_from_users/:id_to_remove", { :controller => "books", :action => "destroy_row_from_users" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

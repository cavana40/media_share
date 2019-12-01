Rails.application.routes.draw do
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

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
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

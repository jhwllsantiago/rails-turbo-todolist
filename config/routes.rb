Rails.application.routes.draw do
  root "todos#index"

  post "/todos", to: "todos#create", as: "todos"
  get "todos/:id", to: "todos#show", as: "todo"
  patch "todos/:id", to: "todos#update"
  put "todos/:id", to: "todos#update"
  delete "/todos/:id", to: "todos#destroy"
  get "/todos/:id/edit", to: "todos#edit", as: "edit_todo"
end

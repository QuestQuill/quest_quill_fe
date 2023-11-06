Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"

  get "/login", to: "users#login_form"
  post "/login", to: "users#login"

  delete "/", to: "users#logout"
  
  resources :users, only: [:show, :new, :create] do 
    resources :campaigns, only: [:show, :new, :create]
  end
end

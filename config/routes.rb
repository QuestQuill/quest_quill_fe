Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"

  get "/auth/github/callback", to: "sessions#create"

  get "/login", to: "users/login#new"
  post "/login", to: "users/login#create"

  get "/email_login", to: "users/login/email_login#new"
  get "/email_login_success", to: "users/login/email_login#create"

  delete "/", to: "users/logout#destroy"
  
  resources :users, only: [:show, :new, :create] do 
    resources :campaigns, only: [:show, :new, :create] do
      resources :towns, only: [:create, :index]
      resources :npcs, only: [:create, :index]
      resources :quests, only: [:create, :index]
    end
  end
end

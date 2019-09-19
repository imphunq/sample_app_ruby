Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  root "static_pages#home"
  get "/help", to: "static_pages#help", as: "helf"
  get "/about", to: "static_pages#about"
  get "contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  post '/signup',  to: 'users#create'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: %i(edit)
  resources :password_resets, only: %i(new create edit update)
  resources :microposts, only: %i(create destroy)
  resources :relationships, only: %i(create destroy)
end

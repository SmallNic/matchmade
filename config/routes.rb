Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index", as: "home_path"
  post "fetch_feed", to: "home#fetch_feed"
  get "matches", to: "home#matches"

  get "items", to: "items#index"

  resources :reviews

end

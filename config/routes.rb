Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  get "myfriends" => "users#friends"
  get "friendedby" => "users#friends"
  get "update-profile" => "users#edit"
  get "profile" => "users#show"

  # Messsages
  resources :messages do
    collection do
      get :inbox
      get :sent
    end
  end

  # Connecting facebook
  get 'auth/:provider/callback' => 'sessions#callback'

  # Friendships
  resources :friendships
  delete "remove_friend" => "friendships#destroy"

  # Sections
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  #posts
  resources :posts
  
  # Home
  root 'home#index'
end

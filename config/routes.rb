Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "myfriends" => "users#friends"
  get "friendedby" => "users#friends"
  get "update-profile" => "users#edit"
  get "profile" => "users#show"
  # get "messages/inbox"
  # get "messages/sent"
  resources :messages do
    collection do
      get :inbox
      get :sent
    end
  end
  get 'auth/:provider/callback' => 'sessions#callback'

  delete "remove_friend" => "friendships#destroy"
  resources :friendships


  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  resources :users

  root 'home#index'
end

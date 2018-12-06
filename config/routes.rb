Rails.application.routes.draw do

  devise_for :users

  unauthenticated :user do
    root 'pages#index', as: :unauthenticated #-> if user is not logged in
  end

  authenticated :user do
    root 'pages#home', as: :root #-> if user is logged in
  #root to: 'pages#home'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end

  resources :users, only: [:index, :show, :edit, :update] do
    collection do
      post "toggle_availability"
    end
  end

  post "/save-coordinates", to: "users#save_coordinates"

  resources :events, only: [:index, :show, :new, :create, :edit, :update] do
    resources :attendees, only: [:create, :destroy]
  end


  namespace :my do
    resources :profile, only: [:index]
  end

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  # chat
  resources :chats, only: [:index]
  namespace :chats do
    resources :events, only: [:show, :update] do
      resources :messages, only: [:create]
    end
    resources :conversations, only: [:show, :create, :update] do
      resources :messages, only: [:create]
    end
  end

end

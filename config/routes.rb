Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update]
  post "/save-coordinates", to: "users#save_coordinates"

  resources :events, only: [:index, :show, :new, :create, :edit, :update]

  namespace :my do
    resources :events, only: [:index]
  end

  resources :attendees, only: [:create]


  # chat
   resources :chats, only: [:index]
  namespace :chats do
    resources :events, only: [:show] do
      resources :messages, only: [:create]
    end
    resources :conversations, only: [:show, :update] do
      resources :messages, only: [:create]
    end
  end

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  resources :conversations, only: [:index, :create, :createConsumer] do
    resources :messages, only: [:create]
  end
end

Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update]

  resources :events, only: [:index, :show, :new, :create, :edit, :update]

  namespace :my do
    resources :events, only: [:index]
  end
  resources :attendees, only: [:create]
end

Rails.application.routes.draw do
  namespace :my do
    get 'events/index'
  end
  get 'attendees/create'
  get 'users/edit'
  get 'users/show'
  get 'users/update'
  get 'events/new'
  get 'events/create'
  get 'events/edit'
  get 'events/update'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update] do
    resources :events, only: [:show, :new, :create, :edit, :update]
  end
  namespace :my do
    resources :events, only: [:index]
  end
  resources :attendees, only: [:create]
end

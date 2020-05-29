Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  get 'dashboard', to: 'pages#dashboard'

  resources :inflatables do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:update, :destroy]
  patch 'bookings/:id/accepted', to: 'bookings#accept', as: :accept
  patch 'bookings/:id/rejected', to: 'bookings#reject', as: :reject
end

Rails.application.routes.draw do
  devise_for :users
  resources :boats
  resources :bookings, only: [:new, :create, :update, :edit, :show]
  resources :users, only: [:edit, :update, :show]
  get 'dashboard' => 'dashboards#show'
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

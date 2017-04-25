Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :boats
  resources :bookings, only: [:new, :create, :update, :edit, :show]
  resources :users, only: [:edit, :update, :show]
  get 'dashboard' => 'dashboards#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

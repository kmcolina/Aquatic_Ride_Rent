Rails.application.routes.draw do
  # get 'bookings/create'
  # get 'bookings/new'
  # get 'objeto_acuaticos/index'
  # get 'objeto_acuaticos/show'
  # get 'objeto_acuaticos/create'
  #  get 'objeto_acuaticos/new'

  resources :objeto_acuaticos, only: [ :index, :show, :create, :new ] do
    resources :bookings, only: [:create, :new]
  end

  devise_for :users
  root to: 'objeto_acuaticos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

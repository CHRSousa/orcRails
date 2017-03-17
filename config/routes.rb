Rails.application.routes.draw do
  
  resources :servicos
  get 'sessions/new'

  get 'users/new'

  resources :tipo_servicos
  resources :unidades
  resources :insumos
  resources :composicaos
  resources :servicos
  resources :users

  get    'sign_in'   => 'sessions#new'
  post   'sign_in'   => 'sessions#create'
  get    'sign_out'  => 'sessions#destroy'
  delete 'sign_out'  => 'sessions#destroy'


  root 'sessions#new'
end

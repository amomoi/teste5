Rails.application.routes.draw do
  
  resources :leituras
  resources :usuarios
  resources :tipo_sensors
  resources :sensors
  
  resources :clientes do
    resources :sensors
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  get 'home', to: 'home#index'
  post 'api', to: 'sensors#create'
  get 'api', to: 'leituras#create'

end

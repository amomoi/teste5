Rails.application.routes.draw do
  
  resources :administradors
  resources :statuses
  resources :leituras
  resources :usuarios
  resources :tipo_sensors
  resources :sensors
  
  resources :clientes do
    resources :sensors do
      resources :statuses
      resources :leituras
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  get 'home', to: 'home#index'
  get 'sms', to: 'sms#index'
  get '/clientes/:id_cliente/sensors/:id_sensor/ultima_leitura', to: 'leituras#ul'
  get 'administrators', to: 'administrators#index'
  get '/login', to: 'login#index'
  post '/login', to: 'login#logar'
  get '/sair', to: 'login#deslogar'

end

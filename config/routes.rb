Rails.application.routes.draw do
  root to: 'stations#index'
  match('stations/graph', {via: :get, to: 'stations#graph'})
  resources :stations
  resources :stops
  resources :lines
end

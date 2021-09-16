Rails.application.routes.draw do
  root 'properties#index'
  resources :properties
  # resources :properties do
  #   resources :stations
  # end
  
end

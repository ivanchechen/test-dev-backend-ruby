Rails.application.routes.draw do

  resources :inits
  root to: "inits#new"

  resources :payments
  resources :items
  resources :orders
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :orders
  resources :coupons
  resources :brands
  devise_for :users
  resources :reviews
  resources :categories
  resources :products 
  resources :cart_line_items
  resources :wishlists
  resources :addresses
  get 'say/hello'
  get 'say/goodbye'
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

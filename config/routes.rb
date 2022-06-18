Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :products
  resources :carts
  resources :orders
  get 'cart' => 'carts#index', :as => 'cart_index'
  post 'cart/add_product_to_cart/:id' => 'carts#add_product_to_cart', :as => 'add_product_to_cart'
  post 'cart/remove_product_from_cart/:id' => 'carts#remove_product_from_cart', :as => 'remove_product_from_cart'

  get 'my_orders' => 'orders#myorders', :as => 'my_orders'

  # Defines the root path route ("/")
  root "products#index"
  
end

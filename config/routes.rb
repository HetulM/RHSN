Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  resources :conversations do
  	resources :messages
  end

  resources :categories, only: [:index] do
    resources :products, only: [:index]
  end

  resources :friendships

  root "posts#index"

  get 'rooms/show'
  get '/chat' => 'rooms#show'
  mount ActionCable.server => '/cable'

  get '/marketplace' => 'marketplace#index'
  get '/categories' => 'categories#index'
  get '/friendships' => 'friendships#index'

  get '/cart', to: 'order_items#index'
  resources :order_items, path: 'cart/items'

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end
end

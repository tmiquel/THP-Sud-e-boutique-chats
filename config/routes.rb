# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'purchases/create'
  devise_for :users
	resources :users do
		resources :carts, only: [:show]
    	resources :avatars, only: [:create]
	end


	resources :single_cart_pics, only: [:update, :destroy]
	resources :cat_pictures, only: [:index, :show]
	resources :purchases, only: [:create]
  root to: 'cat_pictures#index'
end

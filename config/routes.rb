# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'users/show'
  get 'carts/show'
  get 'cat_pictures/index'
  get 'cat_pictures/show'
  devise_for :users

	resources :users, only: [:show]
	resources :cat_pictures, only: [:index, :show]
	resources :carts, only: [:show]
  root to: 'cat_pictures#index'
end

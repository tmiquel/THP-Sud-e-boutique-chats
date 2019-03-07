# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
    devise_for :users
	resources :cat_pictures, only: [:index, :show]
	resources :carts, only: [:show]
	resources :charges
	

  root to: 'cat_pictures#index'
  
end

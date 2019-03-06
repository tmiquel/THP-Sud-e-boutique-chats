# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
	resources :cat_pictures, only: [:index, :show]
	resources :carts, only: [:show]
	

  root to: 'cat_pictures#index'
  devise_for :users
end

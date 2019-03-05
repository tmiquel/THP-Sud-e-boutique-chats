Rails.application.routes.draw do
  devise_for :users
  resources :charges
  resources :items
  get "items/:id", to: "items#show"

  root "items#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :cereal_brands
  resources :brands, only: [:index, :show, :create, :update, :destroy]
  resources :cereals
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

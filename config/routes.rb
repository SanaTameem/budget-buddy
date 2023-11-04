Rails.application.routes.draw do
  resources :transac_categories
  resources :categories, only: [:index, :show, :new, :create] do
    resources :transacs, only: [:index, :show, :new, :create]
  end
  devise_for :users
  root to: "splash#show"
end

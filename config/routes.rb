Rails.application.routes.draw do

  root 'static_pages#index'
  get 'static_pages/secret'

  devise_for :users

  resources :users, only: [:index, :show, :edit, :update]
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

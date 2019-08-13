Rails.application.routes.draw do

  resources :events
  get '/', to: 'static_pages#index'
  get 'static_pages/secret'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

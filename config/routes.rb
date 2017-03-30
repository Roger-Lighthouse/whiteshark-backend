Rails.application.routes.draw do
  get 'jobs/create'

  get 'users/login'

  resources :beers
  root 'beers#index'


  resources :users

  resources :clients

  resources :jobs


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

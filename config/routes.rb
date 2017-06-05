Rails.application.routes.draw do
  get 'reset/index'
  post 'reset/update'

  namespace :api, { format: 'json' } do
    resources :statuses
  end
  
  resources :places
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'users/index', to: 'users#index'
  get 'users/show/:id', to: 'users#show'
  delete 'users/:id', to: 'users#destroy'
  get 'users/current', to: 'users#current'

end

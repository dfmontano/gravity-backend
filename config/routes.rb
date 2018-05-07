Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'users/index', to: 'users#index'
  get 'users/show/:id', to: 'users#show'
  delete 'users/:id', to: 'users#destroy'
  get 'users/current', to: 'users#current'

  # Stores
  get 'stores/index', to: 'stores#index'
  get 'stores/:id', to: 'stores#show'
  post 'stores/create', to: 'stores#create'
  delete 'stores/:id', to: 'stores#destroy'

  # Categories
  get 'categories/index', to: 'categories#index'
  get 'categories/show/:id', to: 'categories#show'
  post 'categories/create', to: 'categories#create'

  # Subcategories
  get 'categories/:category_id/subcategories', to: 'subcategories#index_by_category'
  post 'subcategories/create', to: 'subcategories#create'

  # Products
  get 'products/index', to: 'products#index'
  get 'products/:id', to: 'products#show'
  delete 'products/:id', to: 'products#destroy'

  # Product's reviews
  get 'products/:product_id/reviews', to: 'products_reviews#index'

end

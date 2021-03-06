Rails.application.routes.draw do
  apipie
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # head '/', to: 'categories#gtfo'
  get '/', to: 'categories#gtfo'
  # Users
  post 'auth/login', to: 'authentication#authenticate'
  post 'users/check_email', to: 'users#check_email'
  post 'users/check_cedula', to: 'users#check_cedula'
  post 'signup', to: 'users#create'
  post 'users/reset_password', to: 'password_reset#create'
  get 'users/index', to: 'users#index'
  get 'users/index/:role', to: 'users#index_by_role'
  get 'users/show/:id', to: 'users#show'
  get 'users/name/:id', to: 'users#name'
  delete 'users/:id', to: 'users#destroy'
  get 'users/current', to: 'users#current'
  put 'users/:id', to: 'users#update'
  patch 'users/password/update', to: 'users#update_password'
  patch 'users/new_password', to: 'password_reset#update'

  # Stores
  get 'stores/index', to: 'stores#index'
  get 'stores/:id', to: 'stores#show'
  get 'subcategories/:subcategory_id/stores', to: 'stores#index_by_subcategory'
  post 'stores/create', to: 'stores#create'
  put 'stores/:id', to: 'stores#update'
  delete 'stores/:id', to: 'stores#destroy'

  # Categories
  get 'categories/index', to: 'categories#index'
  get 'categories/show/:id', to: 'categories#show'
  post 'categories/create', to: 'categories#create'

  # Subcategories
  get 'categories/:category_id/subcategories', to: 'subcategories#index_by_category'
  post 'subcategories/create', to: 'subcategories#create'

  # Products
  get '/stores/:store_id/products', to: 'products#index_by_store'
  get 'products/index', to: 'products#index'
  get 'products/index/approved/:approved', to: 'products#index_approved'
  get 'products/:id', to: 'products#show'
  get 'products/index/featured', to: 'products#featured'
  put 'products/:id', to: 'products#update'
  post 'products/create', to: 'products#create'
  patch 'products/:id/approve', to: 'products#approve'
  delete 'products/:id', to: 'products#destroy'

  # Carts
  get 'users/:user_id/carts/:id', to: 'carts#show'

  # Product's reviews
  get 'products/:product_id/reviews', to: 'products_reviews#index'
  post 'products/reviews/create', to: 'products_reviews#create'

end

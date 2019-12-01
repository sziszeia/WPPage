Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get '/population' => 'population#populationHome'
  get '/home' => 'home#index'
  get '/shop' => 'shop#shopHome'
  get '/admin' => 'admin#adminHome'
  get '/about' => 'about#aboutHome'

  # Admin routes

  get 'newproduct' => 'admin#newProduct'
  post 'createproduct' => 'admin#create'
  delete "/deleteproduct/:id", to: "admin#deleteProduct", as: :product_delete
  post "/editproduct/:id", to: "admin#editProduct", as: :product_edit
  post "/updateproduct/:id", to: "admin#updateProduct", as: :product_update

  # User routes

  get 'newuser' => 'user#register'
  post "createuser" => 'user#createUser'
  delete "/deleteuser/:id", to: "user#deleteUser", as: :user_delete
  post "/edituser/:id", to: "user#editUser", as: :user_edit
  post "/updateuser/:id", to: "user#updateUser", as: :user_update
  post "/login", to: 'user#logIn', as: :user_log_in

  # Shop routes

  post '/addtocart/:id', to:"shop#addToCart", as: :add_to_cart
end

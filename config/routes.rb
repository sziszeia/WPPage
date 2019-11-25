Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'population' => 'population#populationHome'
  get 'home' => 'home#index'
  get 'shop' => 'shop#shopHome'
  get 'admin' => 'admin#adminHome'
  get 'about' => 'about#aboutHome'
end

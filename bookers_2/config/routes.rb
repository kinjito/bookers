Rails.application.routes.draw do
  devise_for :users
  root to:  "home#index"
  resources :users
  get "about" => "home#about" , as: "about"
  resources :books
  get	'users/:id' => 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

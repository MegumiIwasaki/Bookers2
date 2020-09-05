Rails.application.routes.draw do
  root 'users#top'
  get "home/about" => "users#about"
  resources :books
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

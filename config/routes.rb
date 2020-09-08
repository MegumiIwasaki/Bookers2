Rails.application.routes.draw do
  root 'top_pages#top'
  get "home/about" => "top_pages#about"
  resources :books
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root 'homes#top'

  get '/about' => 'homes#about'
  resources :shops
  devise_for :users
end

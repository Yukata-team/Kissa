Rails.application.routes.draw do
  root 'homes#top'

  get '/about' => 'homes#about'
  get '/shop/index' => 'shops#index'
  devise_for :users
end

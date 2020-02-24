Rails.application.routes.draw do
  root 'homes#top'
  get '/about' => 'homes#about'

  get '/shops/search' => 'shops#search'
  resources :shops

  get '/:id/posts/new' => 'posts#new'
  post '/:id/posts/new' => 'posts#create'
  post '/posts/:id' => 'posts#destroy'
  resources :posts, only: [:edit, :update, :destroy]

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
end

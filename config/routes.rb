Rails.application.routes.draw do
  root 'homes#top'
  get '/about' => 'homes#about'

  get '/shops/search' => 'shops#search'
  post '/shops/average' => 'shops#average'
  get '/shops/places' => 'shops#places'
  resources :shops do
    resources :shop_images, only: [:index, :create, :destroy]
  end

  get '/:id/posts/new' => 'posts#new'
  post '/:id/posts/new' => 'posts#create'
  resources :posts, only: [:show, :edit, :update, :destroy]

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]

  resources :places, only: [:index]

end

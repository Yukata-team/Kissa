Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'homes#top'
  get '/about' => 'homes#about'

  get '/shops/search' => 'shops#search'
  post '/shops/average' => 'shops#average'
  get '/shops/places' => 'shops#places'
  resources :shops do
    resources :shop_images, only: [:index, :create, :destroy]
  end

  resources :posts, only: [:show, :edit, :update, :destroy]
  get '/:id/posts/new' => 'posts#new', as: 'shop_post_new'
  post '/:id/posts/new' => 'posts#create', as: 'shop_post_create'

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]

  resources :places, only: [:index]

end

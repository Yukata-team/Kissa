Rails.application.routes.draw do
  get '/contacts' => 'contacts#new'
  post '/contacts' => 'contacts#create'

  get '/sitemap', to: redirect('https://s3.amazonaws.com/bucket_name/sitemaps/sitemap.xml.gz')

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'homes#top'
  get '/corp' => 'homes#corp'
  get '/privacy' => 'homes#privacy'
  get '/sitemap' => 'homes#sitemap'

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

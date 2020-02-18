Rails.application.routes.draw do
  root 'homes#top'
  get '/about' => 'homes#about'

  get '/shops/search' => 'shops#search'
  resources :shops

  get '/:id/posts/new' => 'posts#new'
  post '/:id/posts/new' => 'posts#create'

  devise_for :users
end

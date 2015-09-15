MadrastersForum::Application.routes.draw do
  devise_for :users
  resources :tags
  resources :posts do
  	resources :comments
  end
  root 'posts#index'
end

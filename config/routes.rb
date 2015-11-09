MadrastersForum::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :tags
  resources :domains
  resources :events
  resources :locations
  resources :posts do
  	resources :comments
  end
  root 'posts#index'
end

MadrastersForum::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks",
                                        :registrations => "users/registrations" }
  resources :tags,:domains,:roles

  resources :locations do
    resources :events
  end



  resources :events
  get "meetup" => "meetup#index"
  get "meetup/:location" => "meetup#index"
  get "meetup/:location/:id" => "meetup#show"
  get "meetup/:location/:id/edit" => "meetup#edit"


  get "workshop" => "workshop#index"
  get "workshop/:location" => "workshop#index"
  get "workshop/:location/:id" => "workshop#show"
  get "meetup/:location/:id/edit" => "workshop#edit"


  # get 'events/new', :to => 'meetups#new', :as => :my_page

  #  resources :chennai do
  #   resources :events
  #   get 'chennai_test', :on => :member
  # end

  # resources :events
  # resources :chennai, controller: 'locations'

  # resources :meetup do
  #   resources :chennai, controller: 'locations'
  # end

    # resources :chennai do
    #   collection do
    #     get 'meetup'
    #   end
    # end
    # get '/chennai/meetup', to: 'meetups#index'

  resources :posts do
    resources :comments
  end

  get ":location/events" => "events#index"

  # new_change_custom_reports '/custom_reports/change/new', :controller => 'custom_reports', :action => 'new', :default => {:module_type => 'change'}
  # namespace location_based_meetup '/meetup/chennai', :controller => 'events_controller', :action => 'new'
  root 'events#index'


end

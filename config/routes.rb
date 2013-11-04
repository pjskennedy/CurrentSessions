CurrentSessions::Application.routes.draw do

  devise_for :admin, :controllers => {:registrations => "admins/registrations", :sessions => "admins/sessions"} do
    get "admin" => "admins#mainpage"
    namespace :admins do
      get "" => "admins#mainpage"
      resources :admins

      # For Vimeo Refreshes
      put :"videos/refresh"
      put :"videos/ordering"

      resources :videos do
        resources :video_photos 
        resources :video_audio_files
      end
    end
  end

  get :'home/blocked', :as => :not_verified


  resources :emails
  resources :videos, :only => [:index] 

  get ""           => "videos#index"
  get "/about"     => "home#about"
  get "/contact"   => "home#contact"
  get "/downloads" => "video_audio_files#index"
  get "/:url_route" => "videos#show", :as => :video

  root :to => 'videos#index'
  

end

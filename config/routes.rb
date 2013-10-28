Currentsessions::Application.routes.draw do
  
  resources :main
  resources :email

  devise_for :admins

  post   '/contact'             => "email#create"

  # Videos
  get    "/videos"              => "videos#index"
  put    '/videos/add_photo'      => "video_photos#create"
  put    '/videos/add_audio_files' => "video_audio_files#create"
  put    '/videos/:id'          => "videos#update"
  put    '/videos'              => "videos#refresh"
  delete '/videos/:id'          => 'videos#delete'
  # Photos
  delete "video_photos/destroy"

  # Admins
  get    '/admin/videos/:id'    => "admins#edit_video"
  get    '/admin'               => "admins#index"
  get    '/admin/locked_out'    => "admins#locked_out"
  get    '/admin/sign_out'      => "admins#exit"
  get    '/admin/admins'        => 'admins#admins'
  put    '/admin/all/:id'       => 'admins#update'
  delete '/admin/:id'           => 'admins#delete'
  delete '/admin/sessions'      => 'admins#index'

  # General Page Get's
  get     ''                    => "home#sessions"
  get     '/blog'               => "home#blog" 
  get     '/about'              => "home#about" 
  get     '/contact'            => "home#contact"
  get     '/not-found'          => "home#not_found"
  get     "/:name"              => "home#sessionpage"

  root :to => 'home#sessions'

end

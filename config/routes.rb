MusicApp::Application.routes.draw do
  
  root to: 'bands#index'
  resources	:bands
  resources :users, :only => [:new, :create]
  resource :session, :only => [:new, :create, :destroy]
end

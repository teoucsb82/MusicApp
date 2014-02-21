MusicApp::Application.routes.draw do
  
  root to: 'static_pages#index'

  shallow do
    resources :bands do
      resources :albums do
        resources :tracks
      end
    end
  end

  resources :users, :only => [:new, :create]
  resource :session, :only => [:new, :create, :destroy]
end

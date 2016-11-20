Rails.application.routes.draw do
  
  resources :articles do 
    resources :article_comments
  end
  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'static_pages/home'
  get 'static_pages/local'
  get 'static_pages/national'
  get 'static_pages/help'

  get 'static_pages/sign_up_success'
  get 'static_pages/become_a_writer'

  resources :bands do
    member { post :vote }
    get :following, :followers
    resources :albums, :except => [:update, :destroy] do
      member { post :vote }
      resources :songs do
        member { post :vote }
      end
    end
    resources :events
    resources :members
  end
  post "/bands/:band_id/songs/:id(.:format)", :to=>"songs#set_song_id"
  resources :albums, :only => [:update, :destroy]
  resources :relationships,       only: [:create, :destroy]
  get 'users/index'

  get 'users/show'
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'static_pages#home'

end

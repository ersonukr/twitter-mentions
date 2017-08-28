Rails.application.routes.draw do

  root 'homes#index'
  # twitter auth and callback
  get '/auth/twitter', as: 'twitter-authentication'
  get '/auth/twitter/callback' => 'oauths#twitter_callback', as: 'twitter-callback'
  get '/auth/failure' => 'oauths#failure_callback', as: 'callback-failure'
  delete 'oauths/destroy' => 'oauths#destroy', as: 'destroy'

  # mentions and reply
  resources :mentions, only: [:index] do
    collection do
      post 'reply'
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root 'sessions#new'

  resources :items
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  post '/items/fulfill', to: 'items#fulfill'
  post '/items/dismiss', to: 'items#dismiss'
  get '/show', to: 'items#show'

  get '/logout', to: 'sessions#destroy'

  if Rails.env.development?
    get '/coverage', :to => redirect('/coverage/index.html')
  end
end

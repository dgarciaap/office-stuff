Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'items#index'

  resources :items
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  post '/items/fulfill', to: 'items#fulfill'
  post '/items/dismiss', to: 'items#dismiss'
  get '/show', to: 'items#show'

  if Rails.env.development?
    get '/coverage', :to => redirect('/coverage/index.html')
  end
end

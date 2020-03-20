Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'items#index'

  #resources :items
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  #get 'fulfill', to: 'items#fulfill'
  #get 'dismiss', to: 'items#dismiss'
  get 'items/dismiss', to: "items#dismiss"
  get 'items/fulfill', to: "items#fulfill"
  get 'show', to: 'items#show'

  if Rails.env.development?
    get '/coverage', :to => redirect('/coverage/index.html')
  end
end

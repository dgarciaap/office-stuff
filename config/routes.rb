Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'items#index'

  resources :items

  post 'fulfill', to: 'items#fulfill'
  post 'dismiss', to: 'items#dismiss'
  get 'show', to: 'items#show'

  if Rails.env.development?
    get '/coverage', :to => redirect('/coverage/index.html')
  end
end

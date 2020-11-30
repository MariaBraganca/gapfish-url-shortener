Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  post '/links', to: 'links#create'

  get '/:code', to: 'links#show'
end

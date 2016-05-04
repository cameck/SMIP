Rails.application.routes.draw do
  root 'url_shorten#index'
  get '/:small_url' => 'url_shorten#show'
  post '/create' => 'url_shorten#create', as: 'shortner'
  patch '/create' => 'url_shorten#create'

end

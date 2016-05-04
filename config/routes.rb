Rails.application.routes.draw do
  root 'url_shorten#index'
  get 'short_url/:id' => 'url_shorten#show' 
  post '/create' => 'url_shorten#create', as: 'shortner'
end

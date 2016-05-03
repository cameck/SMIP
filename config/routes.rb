Rails.application.routes.draw do
  root 'url_shorten#create'
  post '/create' => 'url_shorten#create', as: 'shortner'
end

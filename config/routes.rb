Rails.application.routes.draw do
  get 'users/show'

  get 'users/dashboard'

  devise_for :users
  root 'home#index'
  get '/users/:id' => "users#show"
  get '/messages' => 'messages#show'
  post '/messages/create' => 'messages#create'
  mount ActionCable.server => '/cable'
end

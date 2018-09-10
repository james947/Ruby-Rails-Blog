Rails.application.routes.draw do
  root 'home#index'

  get '/posts/new' => 'home#newpost'
  get '/posts' => 'home#posts'
  get '/posts/:id' => 'home#show' 
  get '/posts/:id/edit' => 'home#edit'
  get '/about' => 'home#about'
  post '/posts' => 'home#create'
  patch '/posts/:id' => 'home#update'
  delete '/posts/:id' => 'home#destroy'
end

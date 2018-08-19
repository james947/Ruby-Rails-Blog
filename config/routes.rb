Rails.application.routes.draw do
  root 'home#index'

  get '/posts/new' => 'home#newpost'
  get '/posts' => 'home#posts'
  post '/posts' => 'home#create'
  patch '/posts/:id' => 'posts#update'
  delete '/posts/:id' => 'posts#destroy'
  get '/about' => 'home#about'
end

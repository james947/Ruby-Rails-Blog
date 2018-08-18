Rails.application.routes.draw do
  root 'home#index'

  get '/about' => 'home#about'
  get '/new-post' => 'home#newpost'
  get '/posts' => 'home#posts'
  post '/add-post' => 'home#addpost'

end

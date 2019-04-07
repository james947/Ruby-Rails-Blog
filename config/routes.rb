# frozen_string_literal: true

Rails.application.routes.draw do
  root 'blog#index'

  get '/posts/new' => 'blog#newpost'
  get '/posts' => 'blog#posts'
  get '/posts/:id' => 'blog#show', as: 'show'
  get '/posts/:id/edit' => 'blog#edit', as: 'edit'
  get '/about' => 'blog#about'
  post '/posts' => 'blog#create', as: 'create'
  patch '/posts/:id' => 'blog#update', as: 'update'
  delete '/posts/:id' => 'blog#destroy', as: 'destroy'
end

# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get '/posts/new' => 'home#newpost'
  get '/posts' => 'home#posts'
  get '/posts/:id' => 'home#show', as: 'show'
  get '/posts/:id/edit' => 'home#edit', as: 'edit'
  get '/about' => 'home#about'
  post '/posts' => 'home#create', as: 'create'
  patch '/posts/:id' => 'home#update', as: 'update'
  delete '/posts/:id' => 'home#destroy', as: 'destroy'
end

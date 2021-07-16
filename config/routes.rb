# frozen_string_literal: true

Rails.application.routes.draw do
  get '/login' => 'login#create'
  get '/signup' => 'signup#create'

  root to: 'home#index'
end

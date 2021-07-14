# frozen_string_literal: true

Rails.application.routes.draw do
  get '/login' => 'login#create'
  get '/signup' => 'signup#create'
  get '/settings/profile' => 'profile#edit'

  root to: 'home#index'

end

# frozen_string_literal: true

Rails.application.routes.draw do
  get '/login' => 'login#create'

  root to: 'home#index'

end

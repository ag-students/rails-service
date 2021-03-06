# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'k8s', type: :request do
  path '/k8s' do
    get 'Connection' do
      tags 'K8s'
      consumes 'application/json'

      response '200', 'good connection to db' do
        run_test!
      end
    end
  end
end

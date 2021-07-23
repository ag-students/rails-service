# frozen_string_literal: true

require 'rails_helper'
require 'rswag_helper'

RSpec.configure do |config|
  config.extend RswagHelper::RefHelper, type: :request
  config.swagger_root = Rails.root.join('swagger').to_s
  config.swagger_format = :yaml

  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi:    '3.0.1',
      info:       {
        title:   'API V1',
        version: 'v1'
      },
      host:       ENV.fetch('HOST', 'localhost'),
      schemes:    [ENV.fetch('PROTOCOL', 'http')],
      consumes:   ['application/vnd.api+json'],
      produces:   ['application/vnd.api+json'],
      paths:      {},
      components: {
        schemas: RswagHelper.parse_definitions('spec/support/schemas/api/v1')
      }
    }
  }
end

# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Profile', type: :request do
  # include_context 'when the user is logged in'

  let(:user) { create(:user, :with_profile) }

  after do |example|
    example.metadata[:response][:content] = {
      'application/vnd.api+json' => {
        examples: {
          example.metadata[:example_group][:description] => {
            value: JSON.parse(response.body, symbolize_names: true)
          }
        }
      }
    }
  end

  path '/api/v1/profile' do
    patch 'User profile' do
      tags 'Personal Profile'
      parameter name: :data, in: :body, schema: { '$ref' => rswag_ref(:models, 'Profile') }

      response '200', 'profile for user {id}' do
        let(:data) do
          { data: {
            type:       'profiles',
            attributes: {
              surname:    'Lorem',
              name:       'Ipsum',
              middlename: 'Madani',
              gender:     'male',
              birthday:   '2000-02-08',
              phone:      '80-055-535-315',
              email:      'jsmith@example.com'
            }
          } }
        end
        run_test!
      end

      response '422', 'invalid parameters' do
        let(:profile) { { birthday: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/profile' do
    get 'User profile' do
      tags 'Personal Profile'

      response '200', 'Show Profile' do
        schema '$ref' => rswag_ref(:models, 'Profile')

        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:accept) { 'application/json' }
        run_test!
      end
    end
  end
end

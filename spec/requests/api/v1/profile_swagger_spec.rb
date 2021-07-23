# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Profile', swagger_doc: 'v1/swagger.yaml', type: :request do
  # after do |example|
  #   example.metadata[:response][:content] = {
  #     'application/json' => {
  #       examples: {
  #         example.metadata[:example_group][:description] => {
  #           value: JSON.parse(response.body, symbolize_names: true)
  #         }
  #       }
  #     }
  #   }
  # end
  #
  # path '/profile' do
  #   post 'User profile' do
  #     tags 'Profile'
  #     consumes 'application/json'
  #     parameter name: :profile, in: :body, schema: { '$ref' => rswag_ref(:models, 'Profile') }
  #
  #     response '201', 'profile for user {id}' do
  #       let(:profile) do
  #         { id:         'C0223E58-44E6-434E-ABE4-BF7A3F44224E',
  #           surname:    'Lorem',
  #           name:       'Ipsum',
  #           middlename: 'Madani',
  #           gender:     'male',
  #           birthday:   '2000-02-08',
  #           phone:      80_055_535_315 }
  #       end
  #       run_test!
  #     end
  #
  #     response '422', 'invalid request' do
  #       let(:profile) { { id: 'foo' } }
  #       run_test!
  #     end
  #   end
  # end
  #
  # path '/profile/{id}' do
  #   get 'User profile' do
  #     tags 'Profile'
  #     produces 'application/json'
  #     parameter name: :id, in: :path, type: :string
  #
  #     response '200', 'user found' do
  #       schema '$ref' => rswag_ref(:models, 'Profile')
  #
  #       let(:id) { Profile.show(surname: 'foo', name: 'bar').id }
  #       run_test!
  #     end
  #
  #     response '404', 'user not found' do
  #       let(:id) { 'invalid' }
  #       run_test!
  #     end
  #
  #     response '406', 'unsupported accept header' do
  #       let(:accept) { 'application/foo' }
  #       run_test!
  #     end
  #   end
  # end
end

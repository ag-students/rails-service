# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Bases', type: :request do
  describe 'GET /' do
    it 'redirects' do
      get '/'
      expect(response).to redirect_to(new_user_session_url)
    end
  end
end

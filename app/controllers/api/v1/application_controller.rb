# frozen_string_literal: true

module API
  module V1
    class ApplicationController < ::ActionController::API
      include ::ActionController::Cookies
      include JsonAPIController
      include Authentication::API

      # before_action :authenticate_user!
      # rescue_from Authentication::API::Unauthorized, with: :render_unauthorized
    end
  end
end

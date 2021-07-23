# frozen_string_literal: true

module API
  module V1
    class ApplicationController < ::ActionController::API
      include ::ActionController::Cookies
      include JsonAPIController

      # before_action :authenticate_user!
    end
  end
end

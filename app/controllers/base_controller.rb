# frozen_string_literal: true

class BaseController < ApplicationController
  before_action :authenticate_user!

  def index; end
end

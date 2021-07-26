# frozen_string_literal: true

class ExtractAccessToken < BaseInteractor
  include Dry::Monads[:maybe, :result]

  param :session

  def call
    extract_from_session(session)
      .to_result
      .or Failure(TokenNotFound.new)
  end

  private

  def extract_from_session(session)
    Maybe(session[:access_token])
  end

  class TokenNotFound < Error; end
end

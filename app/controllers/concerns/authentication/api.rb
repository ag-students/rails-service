# frozen_string_literal: true

module Authentication
  module API
    private

    def authorize_request
      raise Unauthorized unless request_valid?
    end

    def current_user
      @current_user ||= extract_user
    end

    def extract_user
      ExtractAccessToken
        .call(session)
        .bind { |token|
          UserOfToken
            .call(token)
            .or { |err| dispatch_user_extraction_error(err) }
        }.value_or { raise Unauthorized }
    end

    def dispatch_user_extraction_error(err)
      raise case err
            in V::InvalidToken | V::PubKeyNotFound
              Unauthorized.new(err)
            else
              err
            end
    end

    def request_valid?
      RequestValidator
        .call(session)
        .value_or false
    end

    class Unauthorized < StandardError; end
  end
end

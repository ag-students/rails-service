# frozen_string_literal: true

class UserOfToken < BaseInteractor
  include Dry::Monads[:result, :do]

  param :token

  FIELDS_TRANSLATION = {
    id: :sub
  }.freeze

  def call
    # TODO: implement UnpackToken <- точка верификации токена!
    # unpack_token : jwt_token -[base64_unpack && sig_chech]-> hash
    payload = yield UnpackToken.call(token)
    user = User.new(**get_userdata(payload, %i[id]))

    Success(user)
  end

  private

  def get_userdata(data, keys)
    data.deep_symbolize_keys!
    keys.index_with do |key|
      data[FIELDS_TRANSLATION[key]]
    end
  end
end

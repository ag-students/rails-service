# frozen_string_literal: true

# == Schema Information
#
# Table name: role_users
#
#  id         :bigint           not null, primary key
#  role_id    :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe RoleUser, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

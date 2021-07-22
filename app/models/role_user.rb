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
class RoleUser < ApplicationRecord
  belongs_to :role
  belongs_to :user
end

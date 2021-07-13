# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Role < ApplicationRecord
  has_many :role_users, dependent: :destroy
  has_many :users, through: :role_users, dependent: :destroy

  validates :name, presence: true
end

# frozen_string_literal: true

# == Schema Information
#
# Table name: certificates
#
#  id         :bigint           not null, primary key
#  dates      :datetime         not null
#  vaccine    :string           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Certificate < ApplicationRecord
  belongs_to :user
  validates :dates, :vaccine, presence: true
end

# frozen_string_literal: true

# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  surname    :string           not null
#  patronymic :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  gender     :string           not null
#  birthday   :date             not null
#  weight     :integer          not null
#  adress     :string           not null
#  user_id    :bigint
#
class Profile < ApplicationRecord
  belongs_to :user
  validates :name, :surname, :patronymic, presence: true
  validates :gender, :birthday, :weight, :adress, presence: true
end

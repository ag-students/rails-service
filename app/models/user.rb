# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :role_users, dependent: :destroy
  has_many :roles, through: :role_users, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :patient_appointments,
           class_name:  'Appointment',
           inverse_of:  :patient,
           foreign_key: :patient_id,
           dependent:   :destroy
  has_many :doctor_appointments,
           class_name:  'Appointment',
           inverse_of:  :doctor,
           foreign_key: :doctor_id,
           dependent:   :destroy
  has_one :certificate, dependent: :destroy

  validates :reset_password_token, uniqueness: true
  validates :confirmation_token, uniqueness: true
  validates :email, presence: true, uniqueness: true
end

# frozen_string_literal: true

# == Schema Information
#
# Table name: appointments
#
#  id         :bigint           not null, primary key
#  time       :datetime         not null
#  vaccine    :string           not null
#  dose       :integer          not null
#  note       :text             not null
#  patient_id :bigint           not null
#  doctor_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  aasm_state :string
#
class Appointment < ApplicationRecord
  include AASM

  belongs_to :patient, class_name: 'User', inverse_of: :patient_appointments
  belongs_to :doctor, class_name: 'User', inverse_of: :doctor_appointments

  validates :time, :vaccine, :dose, :note, presence: true

  aasm do
    state :before, initial: true
    state :expectation, :first_component, :second_component

    event :registration do
      transitions from: :before, to: :expectation
    end

    event :first_phase do
      transitions from: :expectation, to: :first_component
    end

    event :second_phase do
      transitions from: :first_component, to: :second_component
    end
  end
end

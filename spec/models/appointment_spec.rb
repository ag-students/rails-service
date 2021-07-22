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
require 'rails_helper'

RSpec.describe Appointment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

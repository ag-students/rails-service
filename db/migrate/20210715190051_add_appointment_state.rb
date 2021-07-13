class AddAppointmentState < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :aasm_state, :string
  end
end

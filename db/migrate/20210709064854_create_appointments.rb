class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.datetime :time, null: false
      t.string :vaccine, null: false
      t.integer :dose, null: false
      t.text :note, null: false
      t.references :patient, null: false
      t.references :doctor, null: false

      t.timestamps
    end
  end
end

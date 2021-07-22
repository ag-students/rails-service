class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.string :patronymic, null: false

      t.timestamps
    end
  end
end

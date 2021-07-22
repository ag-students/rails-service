class CreateCertificates < ActiveRecord::Migration[6.1]
  def change
    create_table :certificates do |t|
      t.datetime :dates, null: false
      t.string :vaccine, null: false
      t.references :user, null: false
      
      t.timestamps
    end
  end
end

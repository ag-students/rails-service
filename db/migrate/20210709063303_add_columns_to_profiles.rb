class AddColumnsToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :gender, :string, null: false
    add_column :profiles, :birthday, :date, null: false
    add_column :profiles, :weight, :integer, null: false
    add_column :profiles, :adress, :string, null: false
  end
end

class CreateRoleUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :role_users do |t|
      t.references :role, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end

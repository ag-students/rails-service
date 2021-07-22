class RemoveFromUser < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.remove :login
      t.remove :password
    end
  end
end

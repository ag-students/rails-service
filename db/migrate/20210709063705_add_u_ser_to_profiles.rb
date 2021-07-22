class AddUSerToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_reference :profiles, :user
  end
end

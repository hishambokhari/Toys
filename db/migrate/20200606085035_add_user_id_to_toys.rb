class AddUserIdToToys < ActiveRecord::Migration[6.0]
  def change
    add_column :toys, :user_id, :int
  end
end

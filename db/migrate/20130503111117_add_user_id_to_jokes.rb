class AddUserIdToJokes < ActiveRecord::Migration
  def change
    add_column :jokes, :user_id, :integer
    add_index :jokes, :user_id
  end
end

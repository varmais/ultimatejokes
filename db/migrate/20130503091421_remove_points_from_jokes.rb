class RemovePointsFromJokes < ActiveRecord::Migration
  def up
    remove_column :jokes, :points
      end

  def down
    add_column :jokes, :points, :integer
  end
end

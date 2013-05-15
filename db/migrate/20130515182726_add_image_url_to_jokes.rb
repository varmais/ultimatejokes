class AddImageUrlToJokes < ActiveRecord::Migration
  def change
    add_column :jokes, :image_url, :string
  end

  def down
    remove_column :jokes, :image_url
  end
end

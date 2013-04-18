class CreateJokes < ActiveRecord::Migration
  def change
    create_table :jokes do |t|
      t.string :title
      t.string :content
      t.integer :points

      t.timestamps
    end
  end
end

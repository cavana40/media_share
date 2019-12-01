class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.string :title
      t.string :source
      t.integer :users_id
      t.string :genre_topic
      t.text :description
      t.text :comments

      t.timestamps
    end
  end
end

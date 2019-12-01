class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :description
      t.integer :users_id
      t.string :genre_topic
      t.text :comments

      t.timestamps
    end
  end
end

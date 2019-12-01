class CreateFilms < ActiveRecord::Migration[5.1]
  def change
    create_table :films do |t|
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

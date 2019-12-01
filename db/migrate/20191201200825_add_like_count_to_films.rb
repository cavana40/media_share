class AddLikeCountToFilms < ActiveRecord::Migration[5.1]
  def change
    add_column :films, :likes_count, :integer
  end
end

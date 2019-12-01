class AddLikeCountToShows < ActiveRecord::Migration[5.1]
  def change
    add_column :shows, :likes_count, :integer
  end
end

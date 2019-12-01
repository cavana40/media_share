class AddLikeCountToPodcasts < ActiveRecord::Migration[5.1]
  def change
    add_column :podcasts, :likes_count, :integer
  end
end

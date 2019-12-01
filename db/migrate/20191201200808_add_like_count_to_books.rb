class AddLikeCountToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :likes_count, :integer
  end
end

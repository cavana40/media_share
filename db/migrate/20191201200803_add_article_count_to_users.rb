class AddArticleCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :articles_count, :integer
  end
end

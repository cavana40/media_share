class Article < ApplicationRecord
  # Direct associations

  has_many   :likes,
             :foreign_key => "articles_id",
             :dependent => :destroy

  belongs_to :users,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end

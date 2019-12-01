class Book < ApplicationRecord
  # Direct associations

  has_many   :likes,
             :foreign_key => "books_id",
             :dependent => :destroy

  belongs_to :users,
             :class_name => "User"

  # Indirect associations

  # Validations

end

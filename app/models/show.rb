class Show < ApplicationRecord
  # Direct associations

  has_many   :likes,
             :foreign_key => "shows_id",
             :dependent => :destroy

  belongs_to :users,
             :class_name => "User"

  # Indirect associations

  # Validations

end

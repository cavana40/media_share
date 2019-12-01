class Book < ApplicationRecord
  # Direct associations

  belongs_to :users,
             :class_name => "User"

  # Indirect associations

  # Validations

end

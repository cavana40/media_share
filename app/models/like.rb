class Like < ApplicationRecord
  # Direct associations

  belongs_to :users,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end

class Like < ApplicationRecord
  # Direct associations

  belongs_to :films,
             :required => false,
             :class_name => "Film",
             :counter_cache => true

  belongs_to :podcasts,
             :required => false,
             :class_name => "Podcast",
             :counter_cache => true

  belongs_to :articles,
             :required => false,
             :class_name => "Article",
             :counter_cache => true

  belongs_to :shows,
             :required => false,
             :class_name => "Show",
             :counter_cache => true

  belongs_to :books,
             :required => false,
             :class_name => "Book",
             :counter_cache => true

  belongs_to :users,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end

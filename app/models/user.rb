class User < ApplicationRecord
  # Direct associations

  has_many   :films,
             :foreign_key => "users_id",
             :dependent => :destroy

  has_many   :shows,
             :foreign_key => "users_id",
             :dependent => :destroy

  has_many   :books,
             :foreign_key => "users_id",
             :dependent => :destroy

  has_many   :podcasts,
             :foreign_key => "users_id",
             :dependent => :destroy

  has_many   :articles,
             :foreign_key => "users_id",
             :dependent => :destroy

  has_many   :follow_requests,
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :likes,
             :foreign_key => "users_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

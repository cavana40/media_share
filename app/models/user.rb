class User < ApplicationRecord
  # Direct associations

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

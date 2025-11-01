class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy  # when a user is deleted, all their associated posts will also be deleted automatically.
  has_many :comments, dependent: :destroy  # when a user is deleted, all comments they authored will be deleted too.

end

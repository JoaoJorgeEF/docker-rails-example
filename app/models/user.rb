class User < ApplicationRecord

  # A user can follow many other users
  has_many :followings, foreign_key: :follower_id
  has_many :followed_users, through: :followings, source: :followed

  # A user can be followed by many other users
  has_many :inverse_followings, class_name: 'Following', foreign_key: :followed_id
  has_many :followers, through: :inverse_followings, source: :follower

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

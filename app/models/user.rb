class User < ApplicationRecord
  # This is the model for the a user. 

  # This ensures that a user must have a name and a username. 
  validates_presence_of :name
  validates_presence_of :username

  # This is used so that a user can upload their avatar. 
  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :pwned_password

  # Builds the model for a user and states the relationships from a user to different entities. 
  has_many :posts
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end

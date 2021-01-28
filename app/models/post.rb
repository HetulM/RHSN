class Post < ApplicationRecord
  # This is the model for a post. 

	# Builds the model for a post and states the relationships from a post to different entities.  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # States that a post cannot be empty. 
  validates_presence_of :post, allow_blank: false
end

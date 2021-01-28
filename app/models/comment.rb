class Comment < ApplicationRecord
  # This is the model for a comments on posts. 

  # Builds the model for a comments and states the relationships from comments to different entities. 
  belongs_to :user
  belongs_to :post

  # States that a comment cannot be empty. 
  validates :body, presence: true, allow_blank: false
end

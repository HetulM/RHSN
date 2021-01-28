class Like < ApplicationRecord
  # This is the model for a like. 

  # Builds the model for a like and states the relationships from a like to different entities. 
  belongs_to :post
  belongs_to :user
end

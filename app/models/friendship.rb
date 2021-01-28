class Friendship < ApplicationRecord
  # This is the model for user friendships. 

  # Builds the model for friendships and states the relationships from a friendship to different 
  # entities. 
  belongs_to :user
  belongs_to :friend, :class_name => "User"
end

class Message < ApplicationRecord
  # This is the model for a message. 

  # States that a message belongs to a user. 
  belongs_to :user
  
  # "perform_later" is used to make the job run in the background. 
  after_create_commit { BroadcastMessageJob.perform_later self  }
end

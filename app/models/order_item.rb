class OrderItem < ApplicationRecord
  # This is the model for an order item. 

  # Builds the model for an order item and states the relationships from an order item to different entities. 
  belongs_to :order
  belongs_to :product
end

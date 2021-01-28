class Order < ApplicationRecord
  # This is the model for an order. 

  # States that a post contains many items from the class "OrderItem". 
  has_many :items, class_name: 'OrderItem'
end

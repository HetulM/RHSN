class ProductCategory < ApplicationRecord
  # This is the model for a product category. 

  # Builds the model for a product category and states the relationships from a product category to different 
  # entities. 
  belongs_to :product
  belongs_to :category
end

class Product < ApplicationRecord
  # This is the model for a product. 

  # Builds the model for a product and states the relationships from a product to different entities. 
  has_many :product_categories
  has_many :categories, through: :product_categories
end

class Category < ApplicationRecord
  # This is the model for a category. 

  # Builds the model for a category and states the relationships from a category to different entities. 
  has_many :product_categories
  has_many :products, through: :product_categories
end

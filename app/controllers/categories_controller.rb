class CategoriesController < ApplicationController
  # The controller for the categories, this contains index action which uses an sql query to group the categories. 

  # Checks that a user is signed in before they can access the categories page. 
  before_action :authenticate_user!
  
  def index
    @categories = Category.joins(:products).select('categories.*, count(products.id) as products_count').group('categories.id').order("title")
  end
end

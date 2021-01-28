class ProductsController < ApplicationController

  # The controller for the products, this contains the index action which finds the products which are in the 
  # selected category. 

  before_action :authenticate_user!
  
  def index
    @category = Category.find(params[:category_id])
    @products = @category.products.order(:title)
  end
end
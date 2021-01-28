class OrderItemsController < ApplicationController

  # The controller for the order items, this contains the actions to add an item to the cart as well as remove 
  # an item from the cart. 

  before_action :authenticate_user!

  def index
    @items = current_cart.order.items
  end

  def create
    current_cart.add_item(
      product_id: params[:product_id], 
      quantity: params[:quantity]
    )
    flash[:notice] = "Your item has been added to cart."
    redirect_to cart_path
  end

  def destroy
    current_cart.remove_item(id: params[:id])
    flash[:notice] = "Your item has been removed from the cart."
    redirect_to cart_path
  end
end

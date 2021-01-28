class ShoppingCart
  # This is the model for a shopping cart. It contains the methods which are use with the "current_cart". 

  # Initializes a new token when a cart is created. 
  def initialize(token:)
    @token = token
  end

  # Checks if an order exists and creates a new order if one does not. 
  def order
    # Or equals is used so that if an order has been assigned previously, return that instance (find) but if it
    # is nil, we create one in the database on the token. 
    @order ||= Order.find_or_create_by(token: @token) do |order|
      order.sub_total = 0
    end
  end

  # Adds an item to the cart. 
  def add_item(product_id:, quantity: 1)
    product = Product.find(product_id)

    order_item = order.items.find_or_create_by(
      product_id: product_id
    )

    order_item.price = product.price
    order_item.quantity = 1
    order_item.save
  end

  # Removes the item from the cart. 
  def remove_item(id:)
    order.items.destroy(id)
  end

  # Counts the number of items in a cart. 
  def count_items
    order.items.sum(:quantity)
  end

  # Calculates the sum of the items in the current order. 
  def order_total
    order.items.sum(:price)
  end
end

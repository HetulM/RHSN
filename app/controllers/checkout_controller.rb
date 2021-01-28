class CheckoutController < ApplicationController

  # The controller for when a user checks out, this contains the actions which creates a new Stripe session as 
  # well as what happens when you cancel from the Stripe checkout page. The Stripe session contains the 
  # parameters which are sent to the Stripe session. 

  def create
    product = Product.find(params[:id])

    if product.nil?
      redirect_to root_path
      return
    end

    Stripe.api_key = 'sk_test_zCfcR9wfcVUcLIDZtDygEmTv00C0rZmAkW'

    # Setting up a stripe session to take payment
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "Total Price",
        amount: (BigDecimal.new(current_cart.order_total) * 100).round,
        currency: 'gbp',
        quantity: 1
      }],
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url,
      billing_address_collection: 'required',
      shipping_address_collection: {
        allowed_countries: ['GB'],
      }
    )

    respond_to do |format|
      format.js # This renders a js.erb file called create.js.erb 
    end
  end

  def success
    
  end

  def cancel
    redirect_to cart_path
  end
end

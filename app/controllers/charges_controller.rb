class ChargesController < ApplicationController
  def new
  end

  def create
    # lookup the product
    @product = Product.find(params[:product_id])

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @product.price,
      :description => @product.title,
      :currency    => 'aud'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to @product
  end
end

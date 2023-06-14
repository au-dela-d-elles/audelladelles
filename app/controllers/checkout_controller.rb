class CheckoutController < ApplicationController
  def create
    if params[:product_id]
      product = Product.find(params[:product_id])
      @session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [
          {
            price_data: {
              currency: 'eur',
              unit_amount: (product.price * 100).to_i,
              product_data: {
                name: product.name
              }
            },
            quantity: 1
          }
        ],
        mode: 'payment',
        success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
        cancel_url: checkout_cancel_url
      )
    elsif params[:total]
      @total = params[:total].to_d
      # Autres logiques de création de session Stripe pour le total
    end

    redirect_to @session.url, allow_other_host: true if @session
  end
  
  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel
  end
end


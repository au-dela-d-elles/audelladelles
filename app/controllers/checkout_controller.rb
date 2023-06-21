class CheckoutController < ApplicationController
  def create
    # Récupération du total à partir des paramètres et conversion en décimal
    @total = params[:total].to_d
    
    # Création d'une session de paiement Stripe
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: 'eur',
            unit_amount: (@total*100).to_i,
            product_data: {
              name: 'Rails Stripe Checkout',
            },
          },
          quantity: 1
        },
      ],
      mode: 'payment',
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )
    
    # Redirection vers l'URL de la session de paiement Stripe
    redirect_to @session.url, allow_other_host: true #envoi email dès que la commande est confirmée
  end

  def success
    # Récupération de la session de paiement et du paiement associé à partir des paramètres
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    checkout_send
    current_user.cart.orders.destroy_all
  end

  def cancel
    # Action vide pour la page d'annulation du paiement
  end

  private

    def cart
      @cart ||= current_user.cart
    end

    def checkout_send
      UserMailer.confirm_checkout(current_user, cart).deliver_now
    end
end

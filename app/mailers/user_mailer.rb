class UserMailer < ApplicationMailer
    default from: 'hello@mathieustrosberg.com'
    # default from: 'no-reply@audeladelles.fr'

    def welcome_email(user)
        @user = user 
        @url  = 'https://audeladelles.fly.dev/' 
        mail(to: @user.email, subject: 'Bienvenue chez nous !', template_name: 'welcome_email') 
    end

    def cart
      @cart ||= current_user.cart
    end

    def confirm_checkout(user, cart)
        @user = user
        @cart = @user.cart
        @order = Order.find_by(cart_id: @cart.id)
        @products_in_cart = Order.where(cart_id: @cart.id)
        @product_prices = @products_in_cart.map(&:unit_price)
        @total_price = calculate_total_price(@products_in_cart)

        mail(to: @user.email, subject: 'Confirmation de votre commande', template_name: 'confirm_checkout')
    end

    private 

    def calculate_total_price(products)
        total_price = 0
        products.each do |product|
          total_price += product.unit_price
        end
        total_price
      end
end

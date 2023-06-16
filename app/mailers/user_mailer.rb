class UserMailer < ApplicationMailer
    default from: 'no-reply@audeladelles.fr'
    # default from: ENV['MAILJET_NOREPLY_FROM']
    # default from: ENV['MAILJET_CONTACT_FROM']

    def welcome_email(user)
        @user = user 
        @url  = 'http://monsite.fr/login' 
        mail(to: @user.email, subject: 'Bienvenue chez nous !', template_name: 'welcome_email') 
    end

    def confirm_checkout(user)
        @user = user
        @products_in_cart = Order.where(cart_id: @cart.id)
        @product_prices = @products_in_cart.map(&:unit_price)
        @total_price = calculate_total_price(@products_in_cart)

        mail(to: @user.email, subject: 'Merci pour votre commande', template_name: 'confirm_checkout')
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

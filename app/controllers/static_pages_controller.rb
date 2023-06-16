class StaticPagesController < ApplicationController

  def Home
    @items_in_cart = current_user.cart.items if current_user
  end
    
  def Contact
  end

  def Notre_histoire
  end

  def Nos_partenaires
  end
  
end

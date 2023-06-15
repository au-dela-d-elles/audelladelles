class AddUserToCarts < ActiveRecord::Migration[7.0]
  def change
    add_reference :carts, :user, foreign_key: true, null: true
  
    Cart.reset_column_information
    Cart.find_each do |cart|
      cart.update(user_id: cart.user_id || User.first&.id)
    end
  
    change_column_null :carts, :user_id, false
  end
end

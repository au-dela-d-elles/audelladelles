class AddUserIdToOrderables < ActiveRecord::Migration[7.0]
  def change
    add_reference :orderables, :user, null: false, foreign_key: true
  end
end

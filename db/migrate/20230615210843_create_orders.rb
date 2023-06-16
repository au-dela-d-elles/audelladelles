class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :item, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end

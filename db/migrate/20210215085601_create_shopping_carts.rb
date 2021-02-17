class CreateShoppingCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_carts do |t|
      t.integer :status, default: 0
      t.string :ip

      t.timestamps
    end
  end
end

class CreateShoppingCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_carts do |t|
      t.integer :status
      t.string :ip

      t.timestamps
    end
  end
end

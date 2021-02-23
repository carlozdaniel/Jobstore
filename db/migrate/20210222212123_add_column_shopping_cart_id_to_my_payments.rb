class AddColumnShoppingCartIdToMyPayments < ActiveRecord::Migration[6.0]
  def change
    add_column :my_payments, :shopping_cart, index: true, foreign_key: true
  end
end

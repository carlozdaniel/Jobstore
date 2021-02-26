class AddColumnShoppingCartIdToMyPayments < ActiveRecord::Migration[6.0]
  def change
    add_reference :my_payments, :shopping_cart, index: true
  end
end

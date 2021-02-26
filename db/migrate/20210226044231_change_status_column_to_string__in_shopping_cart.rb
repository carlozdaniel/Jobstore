class ChangeStatusColumnToStringInShoppingCart < ActiveRecord::Migration[6.0]
  def change
    change_column :shopping_carts, :status, :string
  end
end

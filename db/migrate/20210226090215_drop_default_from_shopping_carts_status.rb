class DropDefaultFromShoppingCartsStatus < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:shopping_carts, :status, nil)
  end
end

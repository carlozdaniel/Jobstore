class ChangePricingFromDecimalToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :pricing, :integer
  end
end

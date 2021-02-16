class InShoppingCart < ApplicationRecord
  belongs_to :product
  belongs_to :shopping_cart
end

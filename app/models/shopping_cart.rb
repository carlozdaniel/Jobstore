class ShoppingCart < ApplicationRecord
has_many :products, through: :in_shopping_carts
has_many :in_shopping_carts
end

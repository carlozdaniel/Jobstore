# == Schema Information
#
# Table name: in_shopping_carts
#
#  id               :integer         not null, primary key
#  product_id       :integer         not null
#  shopping_cart_id :integer         not null
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#
class InShoppingCart < ApplicationRecord
  belongs_to :product
  belongs_to :shopping_cart
  has_one :user, through: :product
end


# == Schema Information
#
# Table name: in_shopping_carts
#
#  id               :integer         not null, primary key
#  product_id       :integer         not null
#  shopping_cart_id :integer         not null
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#



# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer         not null, primary key
#  status     :string
#  ip         :string
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class ShoppingCart < ApplicationRecord
  include AASM

  has_many :in_shopping_carts
  has_many :products, through: :in_shopping_carts

  aasm column: "status" do
    state :created, initial: true
    state :payed
    state :failed

    event :pay do
      after do

        #TODO: marcar producto como agado shopping_cart_id.pay!
      end
      transitions from: :created, to: :payed
    end
  end

  def items
    self.products.map{|product| product.paypal_form}
  end

  def total
    products.sum(:pricing)
  end
end

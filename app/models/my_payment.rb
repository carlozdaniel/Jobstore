
# == Schema Information
#
# Table name: my_payments
#
#  id               :integer         not null, primary key
#  email            :string
#  ip               :string
#  status           :string
#  fee              :decimal(6, 2)
#  paypal_id        :string
#  total            :decimal(6, 2)
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  shopping_cart    :
#  shopping_cart_id :integer
#

class MyPayment < ApplicationRecord
  belongs_to :shopping_cart
  include AASM

  aasm column: "status" do
    state :created, initial: true
    state :payed
    state :failed

    event :pay do
      after do
        shopping_cart.pay!
      end
      transitions from: :created, to: :payed
    end
  end
end
 
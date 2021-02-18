require 'rails_helper'

RSpec.describe Product, type: :model do
  it{ should validate_presence_of :name }
  it{ should validate_presence_of :user }
  it{ should validate_presence_of :pricing }

  it "should validate pricing > 0" do
    #product = FactoryGirl.create(:product, pricing: 0)
    #puts product.inspect
    product = FactoryGirl.build(:product, pricing: 0)
    puts product.errors.inspect
    expect(product.valid?).to be_falsy
  end
end

# == Schema Information
#
# Table name: products
#
#  id                  :integer         not null, primary key
#  name                :string
#  pricing             :decimal(10, 2)
#  description         :text
#  user_id             :integer         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#


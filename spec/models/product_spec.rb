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

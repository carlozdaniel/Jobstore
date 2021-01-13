require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      name: "MyString",
      pricing: "9.99",
      description: "MyText",
      user: nil
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[pricing]"

      assert_select "textarea[name=?]", "product[description]"

      assert_select "input[name=?]", "product[user_id]"
    end
  end
end

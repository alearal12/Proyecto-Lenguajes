require 'rails_helper'

RSpec.describe "plates/new", type: :view do
  before(:each) do
    assign(:plate, Plate.new(
      name: "MyString",
      description: "MyString",
      price: 1,
      picture: "MyString"
    ))
  end

  it "renders new plate form" do
    render

    assert_select "form[action=?][method=?]", plates_path, "post" do

      assert_select "input[name=?]", "plate[name]"

      assert_select "input[name=?]", "plate[description]"

      assert_select "input[name=?]", "plate[price]"

      assert_select "input[name=?]", "plate[picture]"
    end
  end
end

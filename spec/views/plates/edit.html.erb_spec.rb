require 'rails_helper'

RSpec.describe "plates/edit", type: :view do
  before(:each) do
    @plate = assign(:plate, Plate.create!(
      name: "MyString",
      description: "MyString",
      price: 1,
      picture: "MyString"
    ))
  end

  it "renders the edit plate form" do
    render

    assert_select "form[action=?][method=?]", plate_path(@plate), "post" do

      assert_select "input[name=?]", "plate[name]"

      assert_select "input[name=?]", "plate[description]"

      assert_select "input[name=?]", "plate[price]"

      assert_select "input[name=?]", "plate[picture]"
    end
  end
end

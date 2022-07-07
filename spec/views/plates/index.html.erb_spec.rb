require 'rails_helper'

RSpec.describe "plates/index", type: :view do
  before(:each) do
    assign(:plates, [
      Plate.create!(
        name: "Name",
        description: "Description",
        price: 2,
        picture: "Picture"
      ),
      Plate.create!(
        name: "Name",
        description: "Description",
        price: 2,
        picture: "Picture"
      )
    ])
  end

  it "renders a list of plates" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Picture".to_s, count: 2
  end
end

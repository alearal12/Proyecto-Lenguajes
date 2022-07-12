require 'rails_helper'

RSpec.describe "plates/show", type: :view do
  before(:each) do
    @plate = assign(:plate, Plate.create!(
      name: "Name",
      description: "Description",
      price: 2,
      picture: "Picture"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Picture/)
  end
end

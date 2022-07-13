require 'rails_helper'

RSpec.describe "clients/index", type: :view do
  before(:each) do
    assign(:clients, [
      Client.create!(
        name: "Name",
        email: "Email",
        password: "Password",
        direction: "Direction"
      ),
      Client.create!(
        name: "Name",
        email: "Email",
        password: "Password",
        direction: "Direction"
      )
    ])
  end

  it "renders a list of clients" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Password".to_s, count: 2
    assert_select "tr>td", text: "Direction".to_s, count: 2
  end
end

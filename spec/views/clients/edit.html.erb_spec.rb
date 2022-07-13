require 'rails_helper'

RSpec.describe "clients/edit", type: :view do
  before(:each) do
    @client = assign(:client, Client.create!(
      name: "MyString",
      email: "MyString",
      password: "MyString",
      direction: "MyString"
    ))
  end

  it "renders the edit client form" do
    render

    assert_select "form[action=?][method=?]", client_path(@client), "post" do

      assert_select "input[name=?]", "client[name]"

      assert_select "input[name=?]", "client[email]"

      assert_select "input[name=?]", "client[password]"

      assert_select "input[name=?]", "client[direction]"
    end
  end
end

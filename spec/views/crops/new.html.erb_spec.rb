require "rails_helper"

RSpec.describe "crops/new", type: :view do
  before(:each) do
    assign(:crop, Crop.new(
      plant_name: "MyString",
      quantity: 1,
      area: 1
    ))
  end

  it "renders new crop form" do
    render

    assert_select "form[action=?][method=?]", crops_path, "post" do
      assert_select "input[name=?]", "crop[plant_name]"

      assert_select "input[name=?]", "crop[quantity]"

      assert_select "input[name=?]", "crop[area]"
    end
  end
end

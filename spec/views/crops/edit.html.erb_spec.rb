require "rails_helper"

RSpec.describe "crops/edit", type: :view do
  before(:each) do
    @crop = assign(:crop, Crop.create!(
      plant_name: "MyString",
      quantity: 1,
      area: 1
    ))
  end

  it "renders the edit crop form" do
    render

    assert_select "form[action=?][method=?]", crop_path(@crop), "post" do
      assert_select "input[name=?]", "crop[plant_name]"

      assert_select "input[name=?]", "crop[quantity]"

      assert_select "input[name=?]", "crop[area]"
    end
  end
end

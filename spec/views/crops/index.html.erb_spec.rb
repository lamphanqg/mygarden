require "rails_helper"

RSpec.describe "crops/index", type: :view do
  before(:each) do
    assign(:crops, [
      Crop.create!(
        plant_name: "Plant Name",
        quantity: 2,
        area: 3
      ),
      Crop.create!(
        plant_name: "Plant Name",
        quantity: 2,
        area: 3
      )
    ])
  end

  it "renders a list of crops" do
    render
    assert_select "tr>td", text: "Plant Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end

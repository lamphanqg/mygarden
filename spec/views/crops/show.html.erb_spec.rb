require "rails_helper"

RSpec.describe "crops/show", type: :view do
  before(:each) do
    @crop = assign(:crop, Crop.create!(
      plant_name: "Plant Name",
      quantity: 2,
      area: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Plant Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end

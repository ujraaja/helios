require "rails_helper"

RSpec.describe "site/studentOutput.html.haml", type: :view do
	before(:each) do
		render
	end

	it "can render" do
		expect(rendered).to include("Result")
	end	

	it "include buttons" do
		expect(rendered).to have_button("Save")
		expect(rendered).to have_button("Download")
		expect(rendered).to have_button("New File")
	end
end
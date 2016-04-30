require "rails_helper"

RSpec.describe "site/studentOutput.html.haml", type: :view do
	before(:each) do
		@students = FactoryGirl.create_list(:student,3)
		@attributes = FactoryGirl.create_list(:attribute,3)
		render
	end

	# it "can render" do
	# 	expect(rendered).to include("Result")
	# end	

	# it "include buttons" do
	# 	expect(rendered).to have_button("Save")
	# 	expect(rendered).to have_button("Download")
	# 	expect(rendered).to have_button("New File")
	# end
end
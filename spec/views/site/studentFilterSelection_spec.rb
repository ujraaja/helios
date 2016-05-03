require "rails_helper"

RSpec.describe "site/studentFilterSelection.html.haml", type: :view do
	before(:each) do
		@query = FactoryGirl.create(:query)
		@queries = FactoryGirl.create_list(:query, 3)
		@student = FactoryGirl.create(:student)
		@students = FactoryGirl.create(:student)
		render
	end

	# it "can render" do
	# 	expect(rendered).to include("Students")
	# 	expect(rendered).to include("Who are you looking for?")
	# end	

	# it "include buttons" do
	# 	expect(rendered).to have_button("Select")
	# 	expect(rendered).to have_button("Apply selected filters")
	# end

	# it "have select options" do
	# 	expect(rendered).to have_select("Gender", :options => ['Male', 'Female'])
	# end

	# it "have checkbox" do
	# 	expect(rendered).to have_checkbox("Name")
	# end
end
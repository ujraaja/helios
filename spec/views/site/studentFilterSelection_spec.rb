require "rails_helper"

RSpec.describe "site/studentFilterSelection.html.haml", type: :view do
	before(:each) do
		@query = FactoryGirl.create(:query)
		@queries = FactoryGirl.create_list(:query, 3)
		@student = FactoryGirl.create(:student)
		@students = FactoryGirl.create_list(:student,3)
		# @students.column_names = FactoryGirl.attributes_for_list(:student, 2)
		render
	end

	xit "can render" do
		expect(rendered).to include("Students")
		expect(rendered).to include("Who are you looking for?")
	end	

	xit "include buttons" do
		expect(rendered).to have_button("Select")
		expect(rendered).to have_button("Apply selected filters")
	end

	xit "have select options" do
		expect(rendered).to have_select("Gender", :options => ['Male', 'Female'])
	end

	xit "have checkbox" do
		expect(rendered).to have_checkbox("Name")
	end
end
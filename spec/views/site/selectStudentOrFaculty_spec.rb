require 'rails_helper'

RSpec.describe "site/selectStudentOrFaculty.html.haml", type: :view do
	it "can render" do
		render
		expect(rendered).to include("Do you want to query Students or Faculty?")
		expect(rendered).to include("Taulbee Survey")
		expect(rendered).to include("Students")
		expect(rendered).to include("Faculty")
	end	
end
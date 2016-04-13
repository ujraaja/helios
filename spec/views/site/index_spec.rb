require "rails_helper"

RSpec.describe "site/index.html.haml", type: :view do
	xit "can render" do
		assign(:spreadsheet, Spreadsheet.create!(:name=>"2016_students", :attachment=>"2016_students.csv"))
		render
		expect(rendered).to include("Choose among existing data files")
	end	
end
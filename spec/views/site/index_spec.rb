require "rails_helper"

RSpec.describe "site/index.html.haml", type: :view do
	it "can render" do
		assign(:spreadsheet, Spreadsheet.create!(:name=>"2016_students"))
		render
		expect(rendered).to include("Choose among existing data files")
	end	
end
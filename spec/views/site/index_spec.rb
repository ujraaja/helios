require "rails_helper"

RSpec.describe "site/index.html.haml", type: :view do	
	it "can render" do
		@spreadsheet = FactoryGirl.create(:spreadsheet)
		@spreadsheets = Array.new(3, @spreadsheet)
		render
		expect(rendered).to include("Choose among existing data files")
	end
end
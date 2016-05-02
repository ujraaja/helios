require "rails_helper"
require "spec_helper"
include RSpecHtmlMatchers

describe 'Site' do
	describe "home page" do
		it "visit home page" do
			visit root_path
			expect(page).to have_content("Select which year's data you want to work on")
		end
	end	

	describe "index" do
		before(:each) do
			visit site_index_path
		end

		it "on index page" do
			expect(page).to have_content("Taulbee Survey")
			expect(current_path).to eq(site_index_path)
		end

		it "redirect to studentFilterSelection" do
			click_on "Select"
			expect(current_path).to eq(site_studentFilterSelection_path)
		end
	end

	describe "studentFilterSelection" do
		before(:each) do
			visit site_studentFilterSelection_path			
		end

		it "on studentFilterSelection page" do
			click_on "Apply"
			expect(current_path).to eq(site_studentOutput_path)
			expect(page).to have_content("Result")  
		end

		it "can add filters" do
			# https://github.com/kucaahbe/rspec-html-matchers#install
			click_button('Add Filter')
			expect(page).to have_tag('select',:with => {:id => 'filtersListInner' })
		end

		it "can retrive multiple attributes" do
			click_button('Add Attribute')
			expect(page).to have_tag('select',:with => {:id => 'attributeListInner' })
		end
	end

	describe "apply filters" do
		before(:each) do
			visit site_studentFilterSelection_path
			click_button('Add Filter')
			click_button('Add Attribute')
		end

		it "filter successfully" do
			click_button('Apply')
			expect(current_path).to eq(site_studentOutput_path)
			expect(page).to have_link("CSV")
			expect(page).to have_link("Repeat Query")
		end
	end

	describe "output" do
		before(:each) do
			visit site_studentOutput_path			
		end

		it "#studentOutput" do
			expect(current_path).to eq(site_studentOutput_path)
			expect(page).to have_content("Result")			
			expect(page).to have_link("CSV")
			expect(page).to have_link("Repeat Query")
		end

		it "#redirect correctly" do
			click_link('Repeat Query')
			expect(page).to have_content("filters")
			expect(page).to have_content("attributes")
		end
	end
end
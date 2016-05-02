require "rails_helper"
require "spec_helper"
include RSpecHtmlMatchers

describe 'Site' do
	describe "home page" do
		it "visit home page" do
			visit root_path
			expect(page).to have_content("Select Year")
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

		# it "redirect to studentFilterSelection" do
		# 	click_on "Select"
		# 	expect(current_path).to eq(site_studentFilterSelection_path)
		# end
	end

	describe "studentFilterSelection" do
		before(:each) do
			visit site_studentFilterSelection_path			
		end

		# it "on studentFilterSelection page" do
		# 	click_on "Apply"
		# 	expect(current_path).to eq(site_studentOutput_path)
		# 	expect(page).to have_content("Result")  
		# end

		# it "can set multiple filters" do
		# 	fill_in('noOfFilters', :with => 2)
		# 	click_button('confirmNoOfFilters')
		# 	# https://github.com/kucaahbe/rspec-html-matchers#install
		# 	expect(page).to have_tag('select',:with => {:id => 'filtersListInner' })
		# end

		# it "can retrive multiple attributes" do
		# 	fill_in('noOfInfo', :with => 2)
		# 	click_button('confirmNoOfInfo')
		# 	expect(page).to have_tag('select',:with => {:id => 'attributeListInner' })
		# end
	end

	describe "apply filters" do
		before(:each) do
			visit site_studentFilterSelection_path
			fill_in('noOfFilters', :with => 1)
			click_button('confirmNoOfFilters')
			fill_in('noOfInfo', :with => 1)
			click_button('confirmNoOfInfo')
		end

		# it "filter successfully" do
		# 	select('name', :from => 'filtersListInner', visible: false)
		# 	select('email', :from => 'attributeListInner', visible: false)
		# 	click_button('Apply')
		# 	expect(current_path).to eq(site_studentOutput_path)
		# 	expect(page).to have_button("Save","Download")
		# 	expect(page).to have_link("CSV")
		# end
	end

	# describe "output" do
	# 	it "#studentOutput" do
	# 		visit site_studentOutput_path
	# 		expect(current_path).to eq(site_studentOutput_path)
	# 	end
	# end
end
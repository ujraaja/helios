require "rails_helper"
require "spec_helper"

describe 'Site' do
	describe "home page" do
		it "visit home page" do
			visit root_path
		end
	end	

	describe "index" do
		before(:each) do
			visit site_index_path
		end

		it "on index page" do
			expect(page).to have_content("Taulbee Survey")  
		end

		it "redirect to selectStudentOrFaculty" do
			click_on "Select"
			expect(current_path).to eq(site_selectStudentOrFaculty_path)
			expect(page).to have_content("Students or Faculty")
		end
	end

	describe "facultyFilterSelection" do
		it "on facultyFilterSelection page" do
			visit site_facultyFilterSelection_path
			click_on "Apply selected filters"
			expect(current_path).to eq(site_facultyOutput_path)
			expect(page).to have_content("Result")  
		end
	end

	describe "studentFilterSelection" do
		it "on studentFilterSelection page" do
			visit site_studentFilterSelection_path
			click_on "Apply selected filters"
			expect(current_path).to eq(site_studentOutput_path)
			expect(page).to have_content("Result")  
		end
	end

	describe "output" do
		it "#facultyOutput" do
			visit site_facultyOutput_path
			expect(current_path).to eq(site_facultyOutput_path)
		end

		it "#studentOutput" do
			visit site_studentOutput_path
			expect(current_path).to eq(site_studentOutput_path)
		end
	end
end
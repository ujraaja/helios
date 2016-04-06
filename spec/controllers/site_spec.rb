require 'rails_helper'

RSpec.describe "SiteController", type: :controller do
	it "#root" do
		visit('/')
		expect(response).to have_http_status(200)
        expect(response).to render_template(:index)
	end

	describe "#index" do
		before(:each) do
			visit site_index_path			
		end

		it "#index" do
			expect(response).to have_http_status(200)
			expect(response).to render_template(:index)
		end

		it "redirects to selectStudentOrFaculty" do
			click_on "Select"
			expect(current_path).to eq(site_selectStudentOrFaculty_path)
			expect(page).to have_content("Students or Faculty")
		end
	end

	describe "#selectStudentOrFaculty" do
		before(:each) do
			visit site_selectStudentOrFaculty_path
		end

		it "#selectStudentOrFaculty" do
			expect(response).to have_http_status(200)
			expect(response).to render_template(:selectStudentOrFaculty)
		end

		it "redirects to studentFilterSelection" do
			click_on "Students"
			expect(current_path).to eq(site_studentFilterSelection_path)
			expect(page).to have_content("Students")
		end

		it "redirects to facultyFilterSelection" do
			click_on "Faculty"
			expect(current_path).to eq(site_facultyFilterSelection_path)
			expect(page).to have_content("Faculty")
		end
	end
	
	it "#facultyFilterSelection" do
		visit site_facultyFilterSelection_path
		expect(response).to have_http_status(200)
		expect(response).to render_template(:facultyFilterSelection)
	end

	it "#studentFilterSelection" do
		visit site_studentFilterSelection_path
		expect(response).to have_http_status(200)
		expect(response).to render_template(:studentFilterSelection)
	end

	it "#facultyOutput" do
		visit site_facultyOutput_path
		expect(response).to have_http_status(200)
		expect(response).to render_template(:facultyOutput)
	end

	it "#studentOutput" do
		visit site_studentOutput_path
		expect(response).to have_http_status(200)
		expect(response).to render_template(:studentOutput)
	end
end
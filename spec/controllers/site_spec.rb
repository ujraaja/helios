require 'rails_helper'

RSpec.describe SiteController, type: :controller do
	describe "GET #index" do
		it "render index template" do
			get :index
			expect(response).to have_http_status(200)
	    	expect(response).to render_template :index
	  end
	end

	describe "GET #selectStudentOrFaculty" do
		it "render selectStudentOrFaculty template" do
			get :selectStudentOrFaculty
			expect(response).to have_http_status(200)
			expect(response).to render_template :selectStudentOrFaculty
		end
	end

	describe "GET #facultyFilterSelection" do
		it "render facultyFilterSelection template" do
			get :facultyFilterSelection
			expect(response).to have_http_status(200)
			expect(response).to render_template :facultyFilterSelection
		end
	end

	describe "GET #studentFilterSelection" do
		it "render studentFilterSelection template" do
			get :studentFilterSelection
			expect(response).to have_http_status(200)
			expect(response).to render_template :studentFilterSelection
		end
	end
	
	describe "GET #facultyOutput" do
		it "render facultyOutput template" do
			get :facultyOutput
			expect(response).to have_http_status(200)
			expect(response).to render_template :facultyOutput
		end
	end

	describe "GET #studentOutput" do
		it "render studentOutput template" do
			get :studentOutput
			expect(response).to have_http_status(200)
			expect(response).to render_template :studentOutput
		end
	end
end
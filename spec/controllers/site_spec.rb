require 'rails_helper'

RSpec.describe "SiteController", type: :controller do
	it "#root" do
		visit('/')
		expect(response).to have_http_status(200)
        expect(response).to render_template(:index)
	end

	it "#index" do
		visit site_index_path
		expect(response).to have_http_status(200)
		expect(response).to render_template(:index)
	end

	it "#selectStudentOrFaculty" do
		visit site_selectStudentOrFaculty_path
		expect(response).to have_http_status(200)
		expect(response).to render_template(:selectStudentOrFaculty)
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
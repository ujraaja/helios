require 'rails_helper'

RSpec.describe SiteController, type: :controller do
	describe "GET #index" do
		it "render index template" do
			get :index
			expect(response).to have_http_status(200)
	    	expect(response).to render_template :index
	  end
	end

	describe "GET #studentFilterSelection" do
		it "render studentFilterSelection template" do
			get :studentFilterSelection
			expect(response).to have_http_status(200)
			expect(response).to render_template :studentFilterSelection
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
require 'rails_helper'

RSpec.describe "SiteController", type: :controller do
	it "#root" do
		visit('/')
		expect(response).to have_http_status(200)
        expect(response).to render_template(:index)
	end
end
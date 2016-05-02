require "rails_helper"

RSpec.describe "site", type: :routing do
	it "root" do
		expect(:get => '/').to route_to('site#index')
	end

	it "#index" do
		expect(:get => 'site/index').to route_to('site#index')
	end


	it "#studentFilterSelection" do
		expect(:get => 'site/studentFilterSelection').to route_to('site#studentFilterSelection')
	end
	
	it "#studentOutput" do
		expect(:get => 'site/studentOutput').to route_to('site#studentOutput')
	end
end
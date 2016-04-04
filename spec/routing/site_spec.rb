require "rails_helper"

RSpec.describe "site", type: :routing do
	it "root" do
		expect(:get => '/').to route_to('site#index')
	end
end
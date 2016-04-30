require "rails_helper"

RSpec.describe "spreadsheets", type: :routing do
	it "#index" do
		expect(:get => 'spreadsheets/index').to route_to('spreadsheets#index')
	end

	it "#new" do
		expect(:get => 'spreadsheets/new').to route_to('spreadsheets#new')
	end
	
	it "#create" do
		expect(:post => 'spreadsheets/create').to route_to(
			:controller => 'spreadsheets',
			:action => 'create')
	end

	it "#destroy" do
		expect(:delete => 'spreadsheets/destroy').to route_to(
			:controller => 'spreadsheets',
			:action => 'destroy')
	end
end
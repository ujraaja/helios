require "rails_helper"

RSpec.describe "cats", type: :routing do
	it "#new" do
		expect(:get => 'cats/new').to route_to('cats#new')
	end
	
	it "#create" do
		expect(:post => 'cats/create').to route_to(
			:controller => 'cats',
			:action => 'create')
	end

	it "#destroy" do
		expect(:delete => 'cats/destroy').to route_to(
			:controller => 'cats',
			:action => 'destroy')
	end
end
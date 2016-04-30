require "rails_helper"

RSpec.describe "site", type: :routing do
	it "root" do
		expect(:get => '/').to route_to('site#index')
	end

	it "#index" do
		expect(:get => 'site/index').to route_to('site#index')
	end

	# it "#selectStudentOrFaculty" do
	# 	expect(:get => 'site/selectStudentOrFaculty').to route_to('site#selectStudentOrFaculty')
	# end

	# it "#facultyFilterSelection" do
	# 	expect(:get => 'site/facultyFilterSelection').to route_to('site#facultyFilterSelection')
	# end

	it "#studentFilterSelection" do
		expect(:get => 'site/studentFilterSelection').to route_to('site#studentFilterSelection')
	end

	# it "#facultyOutput" do
	# 	expect(:get => 'site/facultyOutput').to route_to('site#facultyOutput')
	# end
	
	it "#studentOutput" do
		expect(:get => 'site/studentOutput').to route_to('site#studentOutput')
	end
end
FactoryGirl.define do
	factory :spreadsheet do |f|
		f.name "students_2016"
		f.attachment "students_2016.csv"
	end

	factory :invalid_spreadsheet, parent: :spreadsheet do |f|
		f.name nil
	end
end
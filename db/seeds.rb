# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


cats = [{:name => 'Tim', :color => 'Brown', :age => 7, :eye_color => 'Brown'},
        {:name => 'Brandon', :color => 'Grey', :age => 1, :eye_color => 'Green'},
        {:name => 'Zeek', :color => 'Orange', :age => 2, :eye_color => 'Blue'},
        {:name => 'Greg', :color => 'Black', :age => 5, :eye_color => 'Brown'},
        {:name => 'Shay', :color => 'Orange', :age => 3, :eye_color => 'Brown'},
        {:name => 'Sandra', :color => 'Black', :age => 7, :eye_color => 'Blue'},
        {:name => 'Bobo', :color => 'Brown', :age => 8, :eye_color => 'Green'},
        {:name => 'Johnny', :color => 'Grey', :age => 10, :eye_color => 'Green'},
        ]

cats.each do |cat|
  Cat.create!(cat)
end
class Query < ActiveRecord::Base
    has_many :filters
    has_many :headers
end

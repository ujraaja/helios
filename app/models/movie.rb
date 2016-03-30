class Movie < ActiveRecord::Base
    def Movie.GetRatings
        ['G','PG','PG-13','R']
    end
end

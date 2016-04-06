def get_csv_headers (data)
      require 'csv'
      csv_data = CSV.read data
      headers = csv_data.shift.map do |i|
          i.to_s
      end
      return headers
end
puts get_csv_headers('sample.csv')
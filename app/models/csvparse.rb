def parsedata (data)
    require 'csv'
    csv_data = CSV.read data
    headers = csv_data.shift.map do |i|
        i.to_s
    end
    string_data = csv_data.map do |row| 
        row.map do |cell|
            cell.to_s
        end
    end
    array_of_hashes = []
    string_data.map do |row| 
        array_of_hashes << Hash[*headers.zip(row).flatten]
    end
    return array_of_hashes
end
puts parsedata('sample.csv')
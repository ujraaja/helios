class SiteController < ApplicationController
  def index
    @spreadsheet = Spreadsheet.new
    @spreadsheets = Spreadsheet.all
  end
  
  def studentFilterSelection
    
    @students = Student.all
  end
  
  
  def studentOutput
    puts "HOWDY!"
    
    filters = params.select { |key, value| key.to_s.match(/filter\d+/) }
    comparators = params.select { |key, value| key.to_s.match(/comparator\d+/) }
    filterValues = params.select { |key, value| key.to_s.match(/filterValue\d+/) }
    @attributes = params.select { |key, value| key.to_s.match(/attribute\d+/) }
    
    filters.each do |value|
      puts value.inspect
    end
    comparators.each do |comparator|
      puts comparator.inspect
    end
    filterValues.each do |filterValue|
      puts filterValue.inspect
    end
    @attributes.each do |attribute|
      puts attribute.inspect
    end
    
    @count = @attributes.any? { |hash| hash[1].include?("count") }

    puts filters.inspect
    if filters.length == 0
      @students = Student.all
    else
      queryString = ""
      i = 0
      filters.each do |filter|
        if i > 0
          queryString = queryString + " AND "
        end
        queryString = queryString + filters["filter" + i.to_s] + comparators["comparator" + i.to_s] + "\'" + filterValues["filterValue" + i.to_s] + "\'"
        i = i + 1
      end
      
      puts queryString
      #@students = Student.where(filters["filter0"] + comparators["comparator0"] + "\'" + filterValues["filterValue0"] + "\'")
      @students = Student.where(queryString)
    end
    
  end
  
  private
    def populate_db(csvFile)
      csv_data = CSV.read csvFile
      headers = csv_data.shift
      tableNameStartIndex = csvFile.rindex('/') + 1
      tableName = csvFile[tableNameStartIndex..csvFile.length-5]
      tableName = tableName.underscore.camelize
      tableName = "Data" + tableName
      table = tableName.constantize
      string_data = csv_data.map do |row| 
          row.map do |cell|
              cell.to_s
          end
      end
      array_of_hashes = []
      string_data.map do |row| 
          array_of_hashes << Hash[*headers.zip(row).flatten]
      end
      puts array_of_hashes
      array_of_hashes.each do |value|
          table.create!(value)
      end
    end
end

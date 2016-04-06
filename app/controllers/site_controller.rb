class SiteController < ApplicationController
  def index
    @spreadsheet = Spreadsheet.new
    @spreadsheets = Spreadsheet.all
  end
  
  def selectStudentOrFaculty
  end
  
  def facultyFilterSelection
  end
  
  def studentFilterSelection
  end
  
  def facultyOutput
  end
  
  def studentOutput
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

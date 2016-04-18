class SpreadsheetsController < ApplicationController
  def index
    redirect_to site_facultyOutput_path
  end

  def new
    redirect_to site_facultyOutput_path
  end

  def create
    
      @spreadsheet = Spreadsheet.new(spreadsheet_params)
      
      ###### call parse_csv with the path to csv file
      
      saved = @spreadsheet.saveAndMove
      
      params["spreadsheet"].keys.each do |key|
        puts key.inspect
        puts params["spreadsheet"][key].inspect
      end
      
      location = "public/uploads/spreadsheet/attachment/" + params["spreadsheet"]["attachment"].original_filename
      command = "cat " + location
      system(command)
      
      populate_db(location)
      
      
      if saved
         redirect_to site_index_path, notice: "The Spreadsheet #{@spreadsheet.name} has been uploaded."
      else
         redirect_to site_index_path, notice: "The Spreadsheet #{@spreadsheet.name} has not been uploaded."
      end
  end

  def destroy
    redirect_to site_facultyOutput_path
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
    
    def spreadsheet_params
        params.require(:spreadsheet).permit(:name, :attachment)
      end
      
      def create_db_schema(tableName, attrs)    #attrs -> array of attributes as strings
        tableName = tableName.underscore.camelize
        tableName = "Data" + tableName
        attributes = ""
        attrs.each do |attr|
          attributes << attr
          attributes << ":string "
        end
        `rails generate model #{tableName} #{attributes}`
        `rake db:migrate`
      end
      
      def parse_csv(csvFile)
        csv_data = CSV.read csvFile
        headers = csv_data.shift
        tableNameStartIndex = csvFile.rindex('/') + 1
        tableName = csvFile[tableNameStartIndex..csvFile.length-5]
        create_db_schema(tableName, headers)
      end
end

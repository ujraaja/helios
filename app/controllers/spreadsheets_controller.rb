require 'csv'

class SpreadsheetsController < ApplicationController
  def index
    redirect_to site_studentOutput_path
  end

  def new
    redirect_to site_studentOutput_path
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
      
      parse_csv(location)
      
      if saved
         redirect_to site_index_path, notice: "The Spreadsheet #{@spreadsheet.name} has been uploaded."
      else
         redirect_to site_index_path, notice: "The Spreadsheet #{@spreadsheet.name} has not been uploaded."
      end
  end

  def destroy
    redirect_to site_studentOutput_path
  end
  
  private
      def spreadsheet_params
        params.require(:spreadsheet).permit(:name, :attachment)
      end
      
      def create_db_schema(tableName, attrs, datatypes)    #attrs -> array of attributes as strings
        tableName = tableName.underscore.camelize
        tableName = "Data" + tableName
        attributes = ""
        ind = 0
        attrs.each do |attr|
          attributes << attr
          attributes << ":"
          attributes << datatypes[ind]
          attributes << " "
          ind = ind + 1
        end
        `rails generate model #{tableName} #{attributes}`
        `rake db:migrate`
      end
      
      def isInt(value)
        value == value.to_i.to_s
      end
      
      def determine_db_datatypes(csv_data, headers)
        datatypes = []
        headers.each do |header|
          datatypes << "integer"
        end
        csv_data.map do |row| 
            ind = 0
            row.map do |cell|
                if datatypes[ind] == "integer"
                  if !isInt(cell.to_s)
                    datatypes[ind] = "string"
                  end
                  ind = ind+1
                end
            end
        end
        return datatypes
      end
      
      def parse_csv(csvFile)
        csv_data = CSV.read csvFile
        headers = csv_data.shift
        tableNameStartIndex = csvFile.rindex('/') + 1
        tableName = csvFile[tableNameStartIndex..csvFile.length-5]
        datatypes = determine_db_datatypes(csv_data, headers)
        create_db_schema(tableName, headers, datatypes)
      end
end

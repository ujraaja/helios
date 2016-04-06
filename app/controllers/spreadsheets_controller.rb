class SpreadsheetsController < ApplicationController
  def index
    redirect_to site_facultyOutput_path
  end

  def new
    redirect_to site_facultyOutput_path
  end

  def create
      @spreadsheet = Spreadsheet.new(spreadsheet_params)
      
      if @spreadsheet.saveAndMove
         redirect_to site_index_path, notice: "The Spreadsheet #{@spreadsheet.name} has been uploaded."
      else
         redirect_to site_index_path, notice: "The Spreadsheet #{@spreadsheet.name} has not been uploaded."
      end
  end
  #returns the headers in csv file
  #pass the file location as argument
  def get_csv_headers (data)
      require 'csv'
      csv_data = CSV.read data
      headers = csv_data.shift.map do |i|
          i.to_s
      end
      return headers
  end
  #returns the data in csv file as an array of hashes
  #Each csv column header is stored as a hash key
  #pass the file location as argument
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
  
  def destroy
    redirect_to site_facultyOutput_path
  end
  
   private
      def spreadsheet_params
      params.require(:spreadsheet).permit(:name, :attachment)
   end
end

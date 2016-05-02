require 'csv'

class SpreadsheetsController < ApplicationController
  @@val = false
  
  def index
    redirect_to site_studentOutput_path
  end

  def new
    redirect_to site_studentOutput_path
  end
  
  def receiveAjaxSpreadsheet
    puts"-------------------------------------------"
    puts "Howdy"
    puts"-------------------------------------------"
    
    
    data = {:value => @@val}
    
    respond_to do |format|
      format.json { render :json => data }
    end
  end

  def create
    
    @@val = false
    params_to_pass = spreadsheet_params
    params_to_pass["name"] = params["year"]
    @spreadsheet = Spreadsheet.new(params_to_pass)
    Thread.new do
    
      saved = @spreadsheet.saveAndMove
      #params["spreadsheet"].keys.each do |key| 
        #puts key.inspect 
      #  puts params["spreadsheet"][key].inspect 
      #end 
        
      location = "public/uploads/spreadsheet/attachment/" + params["spreadsheet"]["attachment"].original_filename 
      command = "cat " + location 
      system(command) 
        
      #parse_csv(location) 
      csv_data = CSV.read location 
      headerFields = csv_data[0] 
      headerFields = headerFields.map { |header| 
        CreateHeaderString(header).to_sym 
      } 
        
      iteration = 0 
      csv_data.each do |data| 
       if iteration > 0 
         #puts data.inspect 
         #printData(data)   
         createStudent(headerFields, data, params["year"]) 
       end 
       iteration = iteration + 1 
      end
      ActiveRecord::Base.connection.close
      
          
      @@val = true

    end

    data = {:value => "Howdy"}

    respond_to do |format|
      format.html
      format.js
    end

  end
  
  def createStudent(headerFields, student, year)
     # puts "************************ MB HERE ********************"
    studentData = Hash[headerFields.zip student]
    studentData[:year] = year
    #puts studentData.inspect
    Student.create(studentData)
  end
  
  def printData(data)
    i = 0
    modelString = "rails g model student"
    data.each do |header|
      
      lowercase = CreateHeaderString(header)
      tableString = "t.string :" + lowercase
      #tableString = ":" + lowercase + " => student[" + i.to_s + "],"
      i = i + 1
      #puts tableString
      #modelString = modelString + " " + lowercase + ":string"
    end
    #puts modelString
  end
  
  def CreateHeaderString(header)
    if header.gsub(' ', '_')
        header.gsub!(' ', '_')
      end
      if header.gsub('(', '')
        header.gsub!('(', '')
      end
      if header.gsub(')', '')
        header.gsub!(')', '')
      end
      if header.gsub('/', '')
        header.gsub!('/', '')
      end
      if header.gsub('-', '_')
        header.gsub!('-', '_')
      end
      headerString = header.to_s.downcase
      #puts headerString
      #puts "/"
      if headerString == "class"
        headerString = "classification"
      end
      return headerString
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

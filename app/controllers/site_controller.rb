class SiteController < ApplicationController
  require 'csv'
  def index
    @spreadsheet = Spreadsheet.new
    @spreadsheets = Spreadsheet.all
  end
  
  def studentFilterSelection
    
    @students = Student.all
    @queries = Query.all
    if params["queryLoad"]
      @query = (Query.where("name = " + "\'" + params["queryLoad"] + "\'"))[0]
    end
    
    if @query
      @filterCount = @query.filters.count
      @headerCount = @query.headers.count
    else
      @filterCount = 0
      @headerCount = 0
    end
    
    puts "+++++++++++++++++++++"
    puts params.inspect
    puts @query.inspect
    if params["queryLoad"]
      puts @query.filters.inspect
      puts @query.headers.first.inspect
    end
    
    puts "+++++++++++++++++++++"
  end
  
  
  def saveQuery(params)
    filters = params.select { |key, value| key.to_s.match(/filter\d+/) }
    comparators = params.select { |key, value| key.to_s.match(/comparator\d+/) }
    filterValues = params.select { |key, value| key.to_s.match(/filterValue\d+/) }
    attributes = params.select { |key, value| key.to_s.match(/attribute\d+/) }
    
    @query = Query.create({:name => params["saveName"]})
    
    i = 0
    filters.each do |filter|
      filterRecord = Filter.create(:field => filters["filter" + i.to_s], :comparator => comparators["comparator" + i.to_s], :value => filterValues["filterValue" + i.to_s])
      puts filterRecord.inspect
      #filterRecord.query = @query
      @query.filters << filterRecord
      i = i + 1
    end
    
    i = 0
    attributes.each do |attribute|
      headerRecord = Header.create(:field => attributes["attribute" + i.to_s])
      #headerRecord.query = @query
      @query.headers << headerRecord
      i = i + 1
    end

    puts "*********************"
    puts @query.inspect
    puts "*********************"
    
    @query.save
    flash[:query] = @query
    redirect_to site_studentFilterSelection_path
  end
  
  
  def studentOutput
    puts "---------------------"
    puts params.inspect
    puts "---------------------"
    
    
    if params["commit"] == "Save"
      saveQuery(params)
    else
    
      filters = params.select { |key, value| key.to_s.match(/filter\d+/) }
      comparators = params.select { |key, value| key.to_s.match(/comparator\d+/) }
      filterValues = params.select { |key, value| key.to_s.match(/filterValue\d+/) }
      @attributes = params.select { |key, value| key.to_s.match(/attribute\d+/) }
      
      #filters.each do |value|
      #  puts value.inspect
      #end
      #comparators.each do |comparator|
      #  puts comparator.inspect
      #end
      #filterValues.each do |filterValue|
      #  puts filterValue.inspect
      #end
      #@attributes.each do |attribute|
      #  puts attribute.inspect
      #end
      
      @count = @attributes.any? { |hash| hash[1].include?("count") }
  
      #puts filters.inspect
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
        
        puts "XXXXXXXXXXXXXXXXXXXXXXXX"
        puts queryString
        puts "XXXXXXXXXXXXXXXXXXXXXXXX"
        #@students = Student.where(filters["filter0"] + comparators["comparator0"] + "\'" + filterValues["filterValue0"] + "\'")
        @students = Student.where(queryString)
        respond_to do |format|
          format.html
          format.csv { send_data Student.to_csv(@students) }
        end
      end
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

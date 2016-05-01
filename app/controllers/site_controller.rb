class SiteController < ApplicationController
  require 'csv'
  
  
  def receiveAjax
    puts "XXXXXXXXXXXXXXXXXXX"
    puts params[:c_name].inspect
    dataToSend = Student.select(params[:c_name].to_sym).map(&params[:c_name].to_sym).uniq.inspect
    puts "XXXXXXXXXXXXXXXXXXX"
    
    data = {:value => dataToSend}
    
    respond_to do |format|
      format.json { render :json => data }
    end
    
    #render :nothing => true
  end
  
  
  def index
    @spreadsheet = Spreadsheet.new
    @spreadsheets = Spreadsheet.all
  end
  
  def studentFilterSelection
    
    if(params["yearSelected"])
      session["yearSelected"] = params["yearSelected"]
    end
    
    @students = Student.where("year = \'" + session["yearSelected"] + "\'")
    @queries = Query.all
    if params["queryLoad"]
      @query = (Query.where("name = " + "\'" + params["queryLoad"] + "\'"))[0]
      @filterCount = @query.filters.count
      @headerCount = @query.headers.count
    elsif params[:repeat]
      #@query = flash[:query]
      puts "!!!!!!!!!!!!!!!!!!!!!!!"
      puts flash[:filters].inspect
      puts flash[:comparators].inspect
      puts flash[:filterValues].inspect
      puts flash[:headers].inspect
      values = {}
      values.merge!(flash[:filters])
      values.merge!(flash[:comparators])
      values.merge!(flash[:filterValues])
      values.merge!(flash[:headers])
      @query = unsavedQuery(values)
      @filterCount = flash[:filters].count
      @headerCount = flash[:headers].count
      puts "!!!!!!!!!!!!!!!!!!!!!!!"
    end
    
      @filterValues = []
    if @query
      @query.filters.each do |filter|
        @filterValues << filter.value
      end
      puts "---------------------"
      puts @filterValues.inspect
      puts "---------------------"
    else
      @query = nil
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
  
  def unsavedQuery(params)
    filters = params.select { |key, value| key.to_s.match(/filter\d+/) }
    comparators = params.select { |key, value| key.to_s.match(/comparator\d+/) }
    filterValues = params.select { |key, value| key.to_s.match(/filterValue\d+/) }
    attributes = params.select { |key, value| key.to_s.match(/attribute\d+/) }
    
    @query = Query.new({:name => "No Save"})
    
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
    puts @query.headers.inspect
    puts "*********************"
    
    return @query
  end
  
  
  def studentOutput
    #puts "---------------------"
    #puts params.inspect
    #puts "---------------------"
    
    
    if params["commit"] == "Save"
      saveQuery(params)
    else
    
      filters = params.select { |key, value| key.to_s.match(/filter\d+/) }
      comparators = params.select { |key, value| key.to_s.match(/comparator\d+/) }
      filterValues = params.select { |key, value| key.to_s.match(/filterValue\d+/) }
      @attributes = params.select { |key, value| key.to_s.match(/attribute\d+/) }
      
      flash[:existingQuery] = 1
      flash[:filters] = filters
      flash[:comparators] = comparators
      flash[:filterValues] = filterValues
      flash[:headers] = @attributes
    
      puts "---------------------"
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
      puts "---------------------"
    
      
      @count = @attributes.any? { |hash| hash[1].include?("count") }
  
      #puts filters.inspect
      if filters.length == 0
        @students = Student.where("year = \'" + session["yearSelected"] + "\'")
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
        
        queryString = queryString + " AND year = \'" + session["yearSelected"] + "\'"

        #@students = Student.where(filters["filter0"] + comparators["comparator0"] + "\'" + filterValues["filterValue0"] + "\'")
        @students = Student.where(queryString)
        respond_to do |format|
          format.html
          format.csv { send_data Student.to_csv(@students, @attributes.values) }
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

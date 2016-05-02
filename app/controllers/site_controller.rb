class SiteController < ApplicationController
  require 'csv'
  
  
  def receiveAjax
    dataToSend = Student.select(params[:c_name].to_sym).map(&params[:c_name].to_sym).uniq.inspect
    
    data = {:value => dataToSend}
    
    respond_to do |format|
      format.json { render :json => data }
    end
  end
  
  
  def index
    @spreadsheet = Spreadsheet.new
    @spreadsheets = Spreadsheet.all
  end
  
  def studentFilterSelection
    
    if(params["yearSelected"])
      session["yearSelected"] = params["yearSelected"]
    end
    
    if (session["yearSelected"] != nil)
      @students = Student.where("year = \'" + session["yearSelected"] + "\'")
    end
    @queries = Query.all
    if params["queryLoad"]
      @query = (Query.where("name = " + "\'" + params["queryLoad"] + "\'"))[0]
      @filterCount = @query.filters.count
      @headerCount = @query.headers.count
    elsif params[:repeat]
      values = {}
      values.merge!(flash[:filters])
      values.merge!(flash[:comparators])
      values.merge!(flash[:filterValues])
      values.merge!(flash[:headers])
      @query = unsavedQuery(values)
      @filterCount = flash[:filters].count
      @headerCount = flash[:headers].count
    end
    
      @filterValues = []
    if @query
      @query.filters.each do |filter|
        @filterValues << filter.value
      end
    else
      @query = nil
      @filterCount = 0
      @headerCount = 0
    end
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
      @query.filters << filterRecord
      i = i + 1
    end
    
    i = 0
    attributes.each do |attribute|
      headerRecord = Header.create(:field => attributes["attribute" + i.to_s])
      @query.headers << headerRecord
      i = i + 1
    end
    
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
  
      if filters.length == 0
        if session["yearSelected"] != nil
          @students = Student.where("year = \'" + session["yearSelected"] + "\'")
        end
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
        
        if session["yearSelected"] != nil
          queryString = queryString + " AND year = \'" + session["yearSelected"] + "\'"
        end

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

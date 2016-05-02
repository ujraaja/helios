class SiteController < ApplicationController
  require 'csv'
  
  #receives the ajax call to dynamically populate filter value drop downs
  def receiveAjax
    #grabs all uniq values for the given column
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
  
  #page that displays the fitler selection
  def studentFilterSelection

    #stores the selected year
    if(params["yearSelected"])
      session["yearSelected"] = params["yearSelected"]
    end
    
    #if year wasn't stored, it should be a new selected year, store it
    if (session["yearSelected"] != nil)
      @students = Student.where("year = \'" + session["yearSelected"] + "\'")
    end
    
    @queries = Query.all #gets all the stored queries
    
    #if a query was loaded
    if params["queryLoad"]
      @query = (Query.where("name = " + "\'" + params["queryLoad"] + "\'"))[0]
      @filterCount = @query.filters.count
      @headerCount = @query.headers.count
    elsif params[:repeat]
      #if the user said to repeat the query
      values = {}
      values.merge!(flash[:filters])
      values.merge!(flash[:comparators])
      values.merge!(flash[:filterValues])
      values.merge!(flash[:headers])
      @query = unsavedQuery(values)
      @filterCount = flash[:filters].count
      @headerCount = flash[:headers].count
    end
    
    #grab the existing filter values
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
  
  #when the user clicks to save a query, must save all the filter columns, filter values, and attributes selected
  #then send the user back to the filter selection page
  def saveQuery(params)
    filters = params.select { |key, value| key.to_s.match(/filter\d+/) }
    comparators = params.select { |key, value| key.to_s.match(/comparator\d+/) }
    filterValues = params.select { |key, value| key.to_s.match(/filterValue\d+/) }
    attributes = params.select { |key, value| key.to_s.match(/attribute\d+/) }
    
    @query = Query.create({:name => params["saveName"]})
    
    i = 0
    filters.each do |filter|
      filterRecord = Filter.create(:field => filters["filter" + i.to_s], :comparator => comparators["comparator" + i.to_s], :value => filterValues["filterValue" + i.to_s])
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
  
  #make a query object, but don't actually save it to the database
  #used for the repeat query functionality
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
      @query.filters << filterRecord
      i = i + 1
    end
    
    i = 0
    attributes.each do |attribute|
      headerRecord = Header.create(:field => attributes["attribute" + i.to_s])
      @query.headers << headerRecord
      i = i + 1
    end
    
    return @query
  end
  
  #page that shows the results
  def studentOutput
    if params["commit"] == "Save"
      saveQuery(params)
    else
      #if the query is not being saved
      #select all the filters and filter values chosen
      filters = params.select { |key, value| key.to_s.match(/filter\d+/) }
      comparators = params.select { |key, value| key.to_s.match(/comparator\d+/) }
      filterValues = params.select { |key, value| key.to_s.match(/filterValue\d+/) }
      @attributes = params.select { |key, value| key.to_s.match(/attribute\d+/) }
      
      #store all these values if the user chooses to repeat the query
      flash[:existingQuery] = 1
      flash[:filters] = filters
      flash[:comparators] = comparators
      flash[:filterValues] = filterValues
      flash[:headers] = @attributes
      
      #determine if the user wants the count
      @count = @attributes.any? { |hash| hash[1].include?("count") }
  
      #if no filters selected, display all data for that year
      if filters.length == 0
        if session["yearSelected"] != nil
          queryString = "year = \'" + session["yearSelected"] + "\'"
        end
      else
        #create query string from selected values
        queryString = ""
        i = 0
        filters.each do |filter|
          filterValue = filterValues["filterValue" + i.to_s]
          if filterValue != nil
            if i > 0
              queryString = queryString + " AND "
            end
            queryString = queryString + filters["filter" + i.to_s] + comparators["comparator" + i.to_s] + "\'" + filterValue + "\'"
          end
          i = i + 1
        end
        
        if session["yearSelected"] != nil
          queryString = queryString + " AND year = \'" + session["yearSelected"] + "\'"
        end
      end
      
      

      @students = Student.where(queryString)
      respond_to do |format|
        format.html
        format.csv { send_data Student.to_csv(@students, @attributes.values) }
      end
    end
    
  end
  
  #unused
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

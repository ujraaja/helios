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
end

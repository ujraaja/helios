class SpreadsheetsController < ApplicationController
  def index
    redirect_to site_facultyOutput_path
  end

  def new
    redirect_to site_facultyOutput_path
  end

  def create
      @spreadsheet = Spreadsheet.new(spreadsheet_params)
      
      if @spreadsheet.save
         redirect_to site_index_path, notice: "The Spreadsheet #{@spreadsheet.name} has been uploaded."
      else
         redirect_to site_index_path, notice: "The Spreadsheet #{@spreadsheet.name} has not been uploaded."
      end
  end

  def destroy
    redirect_to site_facultyOutput_path
  end
  
   private
      def spreadsheet_params
      params.require(:spreadsheet).permit(:name, :attachment)
   end
end

require 'rails_helper'
require 'spec_helper'

RSpec.describe SpreadsheetsController, type: :controller do

	describe "GET #index" do
		it "#index" do
			visit spreadsheets_index_path
			expect(response).to have_http_status(200)
		end
	end

	describe "GET #new" do
		it "#new" do
			visit spreadsheets_new_path
			expect(response).to have_http_status(200) 
		end 
	end

	describe "POST #create" do
		context "with valid spreadsheet" do
			it "create a new spreadsheet" do
				expect{
					post :create, spreadsheet: FactoryGirl.attributes_for(:spreadsheet)
				}.to change(Spreadsheet, :count).by(1)
			end

			it "redirect to home page with success" do
				post :create, spreadsheet: FactoryGirl.attributes_for(:spreadsheet)	
				expect(response).to redirect_to(site_index_path)
				expect(flash[:notice]).to include('has been uploaded')  
			end
		end

		context "with invalid spreadsheet" do
			it "does not create new spreadsheet" do
				expect{
					post :create, spreadsheet: FactoryGirl.attributes_for(:invalid_spreadsheet)
				}.to_not change(Spreadsheet, :count)
			end

			it "redirect to home page with success" do
				post :create, spreadsheet: FactoryGirl.attributes_for(:invalid_spreadsheet)	
				expect(response).to redirect_to(site_index_path)
				expect(flash[:notice]).to include('has not been uploaded')  				
			end
		end
	end
end
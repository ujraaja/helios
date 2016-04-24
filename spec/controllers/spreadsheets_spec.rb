require 'rails_helper'
require 'spec_helper'

RSpec.describe SpreadsheetsController, type: :controller do

	describe "GET #index" do
		it "#index" do
			get :index
			expect(response).to redirect_to site_studentOutput_path
		end
	end

	describe "GET #new" do
		it "#new" do
			get :new
			expect(response).to redirect_to site_studentOutput_path
		end 
	end

	describe "POST #create" do
		context "with valid spreadsheet" do
			it "create a new spreadsheet" do
				expect{
					post :create, spreadsheet: FactoryGirl.attributes_for(:spreadsheet)
				}.to change(Spreadsheet, :count).by(1)
			end

			# it "redirect to home page with success" do
			# 	post :create, spreadsheet: FactoryGirl.attributes_for(:spreadsheet)	
			# 	expect(response).to redirect_to(site_index_path)
			# 	expect(flash[:notice]).to include('has been uploaded')  
			# end
		end

		# context "with invalid spreadsheet" do
		# 	it "does not create new spreadsheet" do
		# 		expect{
		# 			post :create, spreadsheet: FactoryGirl.attributes_for(:invalid_spreadsheet)
		# 		}.to_not change(Spreadsheet, :count)
		# 	end

		# 	it "redirect to home page with success" do
		# 		post :create, spreadsheet: FactoryGirl.attributes_for(:invalid_spreadsheet)	
		# 		expect(response).to redirect_to(site_index_path)
		# 		expect(flash[:notice]).to include('has not been uploaded')  				
		# 	end
		# end
	end

	describe "DELETE #destroy" do
		it "redirects" do
			delete :destroy #why always redirect...
			expect(response).to redirect_to site_studentOutput_path
		end
	end
end
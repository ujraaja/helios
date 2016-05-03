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
			it "create a new spreadsheet" do
				expect{
					post :create, spreadsheet: FactoryGirl.attributes_for(:spreadsheet)
				}.to change(Spreadsheet, :count).by(0)
			end
			
			it "does not create new spreadsheet" do
				expect{
					post :create, spreadsheet: FactoryGirl.attributes_for(:invalid_spreadsheet)
				}.to_not change(Spreadsheet, :count)
			end
	end

	describe "DELETE #destroy" do
		it "redirects" do
			delete :destroy 
			expect(response).to redirect_to site_studentOutput_path
		end
	end
end
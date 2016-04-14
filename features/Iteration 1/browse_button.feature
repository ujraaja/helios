Feature: Browse Button
  
  As a User
  So that I can select my file to be uploaded
  I want have a browse button to search through my system's files
  
Scenario: I expect to be able to see a browse button
  Given I am on the home page
  Then I expect to see a "submit" input with id "spreadsheet_attachment"
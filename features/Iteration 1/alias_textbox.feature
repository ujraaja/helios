Feature: Alias Textbox
  
  As a User
  So that I can give an alias to the file I have uploaded
  I want to have a text field to type the alias

Scenario: I expect to be able to see the name text box
  Given I am on the home page
  Then I expect to see a "text" input with id "spreadsheet_name"
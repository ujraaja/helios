Feature: Alias Textbox
  
  As a User
  So that I can give an alias to the file I have uploaded
  I want to have a select to choose the year of the file

Scenario: I should be able to see the year select box
  Given I am on the home page
  Then I should see a select with id "queryList"
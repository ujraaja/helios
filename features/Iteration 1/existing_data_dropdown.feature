Feature: Dropdown Display for Existing Data

  As a User
  So that I can have all the existing data files to choose from on one page
  I want to have a dropdown displayed for the existing data files

Scenario: I should be able to select an existing data file
  Given I am on the home page
  Then I should see a select with id "queryList"
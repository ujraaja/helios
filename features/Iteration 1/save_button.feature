Feature: Save Button
  
  As a User
  So that I can save the filters used to generate results
  I want to have a button which will save the filters

Scenario: I expect to be able to see the save button
  Given I am on the results page
  Then I expect to see a "submit" input labeled "Save"
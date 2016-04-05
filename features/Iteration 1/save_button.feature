Feature: save button
  
  As a User
  So that I can save the filters used to generate results
  I want to have a button which will save the filters

Scenario: I should be able to see the save button
  Given I am on the results page
  Then I should see a "submit" input labeled "Save"
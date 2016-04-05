Feature: new file button
  
  As a User
  So that I can upload or select a new file
  I want to have a button return to the home page
  
Scenario: I should be able to see the new file button
  Given I am on the results page
  Then I should see a "submit" input labeled "New File"
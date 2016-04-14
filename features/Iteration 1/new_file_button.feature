Feature: New File Button
  
  As a User
  So that I can upload or select a new file
  I want to have a button return to the home page
  
Scenario: I expect to be able to see the new file button
  Given I am on the results page
  Then I expect to see a "submit" input labeled "New File"
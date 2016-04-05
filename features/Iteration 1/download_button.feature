Feature: download button

  As a User
  So that I can download the results
  I want to have a button which will save the results

Scenario: I should be able to see the save button
  Given I am on the results page
  Then I should see a "submit" input labeled "Download"
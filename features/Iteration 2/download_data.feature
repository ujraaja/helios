Feature: Download Filtered Data
  
  As a User
  So that I can store a copy of the results
  I want to have a button to initate a download

Scenario: I expect to be able to see the download button
  Given I am on the results page
  When  I press "Download"
  Then I expect a download to commence
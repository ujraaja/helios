Feature: Query Database
  
  As a User
  So that I can get data for reports
  I want to filter data
  
Scenario: After submiting the filters, I expect to see the results
  Given I am on the filters page
  And I press "Apply"
  Then I expect to be on the results page
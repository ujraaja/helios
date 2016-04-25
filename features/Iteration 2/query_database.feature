Feature: Query Database
  
  As a User
  So that I can get data for reports
  I want to filter data
  
Scenario: After submiting the filters, I should see the results
  Given I am on the filters page
  And I press "Apply"
  Then I should be on the results page
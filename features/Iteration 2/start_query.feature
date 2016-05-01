Feature: Start a Query
  
  As a User
  So that I can have multiple filters per query
  I want to be able to add extra filters

@javascript
Scenario: Be able to add more filters
  Given I am on the filters page
  When I press "confirmNoOfFilters"
  And I press "confirmNoOfFilters"
  Then I should see a select with id "filter_0"
  And I should see a select with id "filter_1"
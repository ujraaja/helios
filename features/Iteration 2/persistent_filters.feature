Feature: Persistent Filters
  
  As a User
  So that I can execute similar queries
  I want to have the filter inputs persist with populated data

@javascript
Scenario: Check that filters remain after a query
  Given I am on the filters page
  And I press "confirmNoOfFilters"
  And I press "confirmNoOfInfo"
  
  When I select "classification" from "filter0"
  And I select "=" from "comparator0"
  And I select "U4" from "filterValue0"
  And I select "classification" from "attribute0"
  And I press "Apply"
  And I follow "Repeat Query"
  
  Then I should be on the filters page
  And I expect to see "classification" selected from "filter0"
  And I expect to see "=" selected from "comparator0"
  And I expect to see "U4" selected from "filterValue0"
  And I expect to see "classification" selected from "attribute0"

Feature: Persistent Filters
  
  As a User
  So that I can execute similar queries
  I want to have the filter inputs persist with populated data

Scenario: Check that filters remain after a query
  Given I am on the filters page
  And I fill in "1" for "noOfFilters"
  And I press "confirmNoOfFilters"
  And I fill in "1" for "noOfInfo"
  And I press "confirmNoOfInfo"
  
  When I select "name" from "filter"
  And I select "=" from "comparator"
  And I fill in "Fake Name" for "filterValue"
  And I select "name" from "attribute"
  And I press "Apply"
  And I follow "Back"
  
  Then I am on the filters page
  And I expect to see "name" selected from "filter"
  And I expect to see "=" selected from "comparator"
  And I expect to see "Fake Name" selected from "filterValue"
  And I expect to see "name" selected from "attribute"
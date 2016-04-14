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
  
  When I select "age" from "filter"
  And I select "<" from "comparator"
  And I fill in "20" for "filterValue"
  And I select "name" from "attribute"
  And I press "Apply Filters"
  And I follow "back"
  
  Then I expect to be on the filters page
  And I expect to see "age" selected from "filter"
  And I expect to see "<" selected from "comparator"
  And I expect to see "20" selected from "filterValue"
  And I expect to see "name" selected from "attribute"
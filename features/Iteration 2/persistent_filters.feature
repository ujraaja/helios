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
  
  When I select "name" from "filter_0"
  And I select "=" from "comparator_0"
  And I fill in "Fake Name" for "filterValue_0"
  And I select "name" from "attribute_0"
  And I press "Apply"
  And I follow "back"
  
  Then I expect to be on the filters page
  And I expect to see "name" selected from "filter_0"
  And I expect to see "=" selected from "comparator_0"
  And I expect to see "Fake Name" selected from "filterValue_0"
  And I expect to see "name" selected from "attribute_0"
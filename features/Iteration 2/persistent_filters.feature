Feature: Persistent Filters
  
  As a User
  So that I can execute similar queries
  I want to have the filter inputs persist with populated data

@javascript
Scenario: Check that filters remain after a query
  Given I am on the filters page
  And I fill in "1" for "noOfFilters"
  And I press "confirmNoOfFilters"
  And I fill in "1" for "noOfInfo"
  And I press "confirmNoOfInfo"
  
  When I select "name" from "filter0"
  And I select "=" from "comparator0"
  And I fill in "Fake Name" for "filterValue0"
  And I select "name" from "attribute0"
  And I press "Apply"
  And I follow "Repeat Query"
  
  Then I should be on the filters page
  And I expect to see "name" selected from "filter0"
  And I expect to see "=" selected from "comparator0"
  And I expect to see "Fake Name" selected from "filterValue0"
  And I expect to see "name" selected from "attribute0"

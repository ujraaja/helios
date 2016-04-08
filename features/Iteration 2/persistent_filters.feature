Feature: Persistent Filters
  
  As a User
  So that I can execute similar queries
  I want to have the filter inputs persist with populated data

Scenario: Check that filters remain after a query
  Given I am on the filters page
  When I select "Computer Engineering" from "Field of Study"
  And I press "Select"
  And I press "Apply selected filters"
  And I press "Go to previous page"
  Then I should be on the filters page
  And I should see "Computer Engineering"
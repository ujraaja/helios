Feature: Remove Filter
  
  As a User
  So that I can remove a given filter
  I want to have a button to remove filters

@javascript
Scenario: I should be able to remove a filter
  Given I am on the filters page
  When I press "confirmNoOfFilters"
  Then I should see a select with id "filter_0"
  When I press "removeFilterButton"
  Then I should not see a select with id "filter_0"
  
@javascript
Scenario: I should be able to remove an attribute
  Given I am on the filters page
  When I press "confirmNoOfInfo"
  Then I should see a select with id "attribute_0"
  When I press "removeAttributeButton"
  Then I should not see a select with id "attribute_0"
Feature: Add Filter
  
  As a User
  So that I can add a given filter
  I want to have a button to add filters

@javascript
Scenario: I should be able to add a filter
  Given I am on the filters page
  Then I should not see a select with id "filter_0"
  When I press "confirmNoOfFilters"
  Then I should see a select with id "filter_0"
  
@javascript
Scenario: I should be able to add an attribute
  Given I am on the filters page
  Then I should not see a select with id "attribute_0"
  When I press "confirmNoOfInfo"
  Then I should see a select with id "attribute_0"
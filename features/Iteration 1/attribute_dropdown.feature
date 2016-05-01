Feature: Dropdown Menu for Attributes
  
  As a User
  So that I can see all the possible attributes of a given filter
  I want to see a dropdown to select a given attribute

@javascript
Scenario: I should be able to select an attribute
  Given I am on the filters page
  When I press "confirmNoOfFilters"
  Then I should see a select with id "filter_0"
Feature: Dropdown Menu for Attributes
  
  As a User
  So that I can see all the possible attributes of a given filter
  I want to see a dropdown to select a given attribute

Scenario: I expect to be able to select an attribute
  Given I am on the filters page
  And I fill in "1" for "noOfFilters"
  And I press "confirmNoOfFilters"
  Then I expect to see a "select"
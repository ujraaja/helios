Feature: Apply Filters Button

  As a User
  So that I can select my data based on the filters
  I want to have a button that can apply the filters

Scenario: I expect to be able to see the apply filters button
  Given I am on the filters page
  Then I expect to see a "submit" input labeled "Apply"
  
Scenario: I expect to be taken to the results page upon Apply Filters
  Given I am on the filters page
  And I press "Apply"
  Then I expect to be on the results page

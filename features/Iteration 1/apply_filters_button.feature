Feature: Apply Filters Button

  As a User
  So that I can select my data based on the filters
  I want to have a button that can apply the filters

Scenario: I should be able to see the apply filters button
  Given I am on the filters page
  Then I should see a "submit" input labeled "Apply"
  
Scenario: I expect to be taken to the results page upon Apply Filters
  Given I am on the filters page
  When I press "Apply"
  Then I should be on the results page

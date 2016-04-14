Feature: Apply Filters Button

  As a User
  So that I can select my data based on the filters
  I want to have a button that can apply the filters

Scenario: I expect to be able to see the apply filters button
  Given I am on the filters page
<<<<<<< 65136e61fc1e3ce6f00b9e1b64a29e4a40f9b574
  Then I expect to see a "submit" input labeled "Apply Filters"
  
Scenario: I expect to be taken to the results page upon Apply Filters
  Given I am on the filters page
  And I press "Apply Filters"
  Then I expect to be on the results page
=======
  Then I expect to see a "submit" input labeled "Apply Filters"
>>>>>>> Fixed issues with persistent features; updated tests

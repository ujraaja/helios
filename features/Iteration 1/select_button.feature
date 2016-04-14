Feature: Select Button
  
  As a User
  So that I can use the existing data file picked with the dropdown
  I want to have a select button to finalize my choice
  
Scenario: I expect to be able to see the select button
  Given I am on the home page
<<<<<<< 65136e61fc1e3ce6f00b9e1b64a29e4a40f9b574
  Then I expect to see a "submit" input labeled "Select"
  
Scenario: I expect to be taken to the filters page upon clicking select
  Given I am on the home page
  And I press "Select"
  Then I expect to be on the filters page
=======
  Then I expect to see a "submit" input labeled "Select"
>>>>>>> Fixed issues with persistent features; updated tests

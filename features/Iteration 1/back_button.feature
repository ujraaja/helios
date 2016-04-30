Feature: Back Button
  
  As a User
  So that I can return to the previous page
  I want to have a back button

Scenario: The back button should return to the index page when on the filters page
  Given I am on the filters page
  And I should see a link with href "/site/index"
  When I follow "Back"
  Then I should be on the home page
  
Scenario: The back button should return to the filters page when on the results page
  Given I am on the results page
  And I should see a link with href "/site/studentFilterSelection"
  When I follow "Back"
  Then I should be on the filters page
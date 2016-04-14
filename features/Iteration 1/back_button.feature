Feature: Back Button
  
  As a User
  So that I can return to the previous page
  I want to have a back button
  
Scenario: I expect to be able to return to the home page from the filters page using the href link
  Given I am on the filters page
  Then I expect to see a link with href "/site/index"
  And I follow "back"
  Then I expect to be on the home page

Scenario: I expect to be able to return to the filters page from the results page using the href link
  Given I am on the results page
  And I expect to see a link with href "/site/studentFilterSelection"
  And I follow "back"
  Then I expect to be on the filters page
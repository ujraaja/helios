Feature: Home Button
  
  As a User
  So that I can go directly back to the homepage
  I want to have a home button
  
Scenario: I expect to be able to go to the home page from the results page
  Given I am on the results page
  And I expect to see a link with href "/site/index"
  When I follow "home"
  Then I expect to be on the home page
  
Scenario: I expect to be able to go to the home page from the filters page
  Given I am on the filters page
  And I expect to see a link with href "/site/index"
  When I follow "home"
  Then I expect to be on the home page

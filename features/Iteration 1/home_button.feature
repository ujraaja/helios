Feature: Home Button
  
  As a User
  So that I can go directly back to the homepage
  I want to have a home button
  
Scenario: The home button should return to the index page when on the filters page
  Given I am on the filters page
  And I should see a link with href "/site/index"
  When I follow "Home"
  Then I should be on the home page
  
Scenario: The home button should return to the index page when on the results page
  Given I am on the results page
  And I should see a link with href "/site/index"
  When I follow "Home"
  Then I should be on the home page
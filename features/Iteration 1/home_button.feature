Feature: Home Button
  
  As a User
  So that I can go directly back to the homepage
  I want to have a home button
  
Scenario: I expect to be able to see the home button
  Given I am on the results page
  Then I expect to see a link with href "/site/index"
  
Scenario: I expect to be able to see the home button
  Given I am on the filters page
  Then I expect to see a link with href "/site/index"
Feature: home button
  
  As a User
  So that I can go directly back to the homepage
  I want to have a home button
  
Scenario: I should be able to see the home button
  Given I am on the results page
  Then I should see a link with href "/site/index"
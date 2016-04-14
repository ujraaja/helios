Feature: Back Button
  
  As a User
  So that I can return to the previous page
  I want to have a back button
  
Scenario: I expect to be able to see the back button
  Given I am on the results page
  Then I expect to see a "submit" input labeled "Go to previous page"

Scenario: I expect to be able to see the back button
  Given I am on the results page
  Then I expect to see a link with href "/site/studentFilterSelection"
Feature: Back Button
  
  As a User
  So that I can return to the previous page
  I want to have a back button
  
<<<<<<< 65136e61fc1e3ce6f00b9e1b64a29e4a40f9b574
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
=======
Scenario: I expect to be able to see the back button
  Given I am on the results page
  Then I expect to see a "submit" input labeled "Go to previous page"

Scenario: I expect to be able to see the back button
  Given I am on the results page
  Then I expect to see a link with href "/site/studentFilterSelection"
>>>>>>> Fixed issues with persistent features; updated tests

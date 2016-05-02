Feature: Save Query
  
  As a User
  So that I can re-use a query
  I want to be able to save the given query

@javascript  
Scenario: After setting the filters and saving them, I should be able to recall them
  Given I am on the home page
  And I select "2016" from "queryList"
  And I select "features/cucumber_data.csv" to be uploaded to "spreadsheet_attachment"
  When I press "Save"
  Then I should be on the spreadsheet page
  When I wait "2" seconds to press "returnButton"
  
  Then I should be on the home page
  When I select "2016" from "yearSelected"
  And I press "Select"
  
  Then I should be on the filters page
  When I press "confirmNoOfFilters"
  And I press "confirmNoOfInfo"
  And I press "confirmNoOfInfo"
  And I select "classification" from "filter0"
  And I select "=" from "comparator0"
  And I select "U4" from "filterValue0"
  And I select "classification" from "attribute0"
  And I select "uin" from "attribute1"
  
  When I fill in "Test_Save" for "saveName"
  And I press "Save"
  Then I should be on the filters page
  When I select "Test_Save" from "queryLoad"
  Then I should not see "classification" 
  Then I should not see "=" 
  Then I should not see "U4" 
  Then I should not see "uin" 
  When I press "Load"
  Then I expect to see "classification" selected from "filter0"
  Then I expect to see "=" selected from "comparator0"
  Then I expect to see "U4" selected from "filterValue0"
  Then I expect to see "classification" selected from "attribute0"
  Then I expect to see "uin" selected from "attribute1"
  
Feature: Add Filter
  
  As a User
  So that I can add a given filter
  I want to have a button to add filters

@javascript
Scenario: I should be able to add a filter or attribute
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
  Then I should not see a select with id "filter_0"
  Then I should not see a select with id "attribute_0"
  When I press "confirmNoOfFilters"
  Then I should see a select with id "filter_0"
  When I press "confirmNoOfInfo"
  Then I should see a select with id "attribute_0"
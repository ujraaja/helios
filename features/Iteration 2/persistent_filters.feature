Feature: Persistent Filters
  
  As a User
  So that I can execute similar queries
  I want to have the filter inputs persist with populated data

@javascript
Scenario: Check that filters remain after a query
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
  And I select "classification" from "filter0"
  And I select "=" from "comparator0"
  And I select "U4" from "filterValue0"
  And I select "classification" from "attribute0"
  And I press "Apply"
  And I follow "Repeat Query"
  
  Then I should be on the filters page
  And I expect to see "classification" selected from "filter0"
  And I expect to see "=" selected from "comparator0"
  And I expect to see "U4" selected from "filterValue0"
  And I expect to see "classification" selected from "attribute0"

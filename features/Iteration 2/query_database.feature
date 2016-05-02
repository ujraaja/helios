Feature: Query Database
  
  As a User
  So that I can get data for reports
  I want to filter data

@javascript  
Scenario: After submiting the filters, I should see the results
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
  And I press "Apply"
  
  Then I should be on the results page
  And I should see "classification"
  And I should see "U4"
  And I should see "uin"
  And I should see "UIN-1"

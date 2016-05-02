Feature: Download Filtered Data
  
  As a User
  So that I can store a copy of the results
  I want to have a button to initate a download

@javascript
Scenario: I should be able to see the download button
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
  
  Then I should be on the results page
  Then I should see a link labeled "CSV.csv"
  When I follow "CSV.csv"
  Then A download should commence
  
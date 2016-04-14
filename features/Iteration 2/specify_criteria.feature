Feature: Specify Criteria
  
    As a User
    So that I can select desired range of data
    I want to be able to select <, >, =, etc. and give a value

Scenario: Look for the dropdown which has <, >, =
    Given I am on the filters page
    And I fill in "1" for "noOfFilters"
    And I press "confirmNoOfFilters"
    Then I should see a select with option "="
    And I should see a select with option ">"
    And I should see a select with option "<"
    And I should see a select with option ">="
    And I should see a select with option "<="
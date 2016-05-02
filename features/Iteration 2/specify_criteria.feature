Feature: Specify Criteria
  
    As a User
    So that I can select desired range of data
    I want to be able to select <, >, =, etc. and give a value

@javascript
Scenario: Look for the dropdown which has <, >, =
    Given I am on the filters page
    When I press "confirmNoOfFilters"
    When I select "=" from "comparator_0"
    Then I expect to see "=" selected from "comparator_0"
    When I select "<" from "comparator_0"
    Then I expect to see "<" selected from "comparator_0"
    When I select ">" from "comparator_0"
    Then I expect to see ">" selected from "comparator_0"
    When I select "<=" from "comparator_0"
    Then I expect to see "<=" selected from "comparator_0"
    When I select ">=" from "comparator_0"
    Then I expect to see ">=" selected from "comparator_0"
    
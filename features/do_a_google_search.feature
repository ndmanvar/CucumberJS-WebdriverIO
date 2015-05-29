Feature: Do a Google Search
  Using a web browser
  I want to perform a Google search

  Scenario: Google Search
    Given I visit http://google.com
    When I enter 'cheese' into 'lst-ib'
    Then I should see search results

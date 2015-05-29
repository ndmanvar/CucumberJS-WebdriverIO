Feature: Draft city chicago hompepage
  Using a web browser
  I want to perform a Google search

  Scenario: verify draft city chicago homepage UI
    Given I visit http://www.nfl.com/draft-city-chicago
    Then I should see draft city Chicago image
    Then I should see introduction message

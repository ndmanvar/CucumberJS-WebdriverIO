Feature: Google for Cucumber
  In order to get more info about Cucumber
  As a BDDer
  I want to find Cucumber resources on Google

  Background:
    Given I am on Google

  Scenario: oneq
    When I search for "Cucumber BDD"
    Then I see a link to "https://cucumber.io/"

  Scenario: twoq
    When I search for "Cucumber BDD"
    Then I see a link to "http://cucumber.io/123"


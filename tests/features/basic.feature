Feature: Basic Button

  Background:
    Given I create a Share Button

  @display
  Scenario: Display Networks
    When I click the Share Button
    Then I should see all Social Networks

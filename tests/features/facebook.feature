Feature: Facebook Network

  Background:
    Given I create a Share Button

  Scenario: Display Network
    When I click the Share Button
    Then I should see the Facebook button
    When I click the Facebook button
    Then I should see a new window

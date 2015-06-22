Feature: Twitter Network

  Background:
    Given I create a Share Button

  Scenario: Display Network
    When I click the Share Button
    Then I should see the Twitter button
    When I click the Twitter button
    Then I should see a new window

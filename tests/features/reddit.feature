Feature: Reddit Network

  Background:
    Given I create a Share Button

  Scenario: Display Network
    When I click the Share Button
    Then I should see the Reddit button
    When I click the Reddit button
    Then I should see a new window

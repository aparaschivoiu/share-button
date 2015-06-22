Feature: Email Network

  Background:
    Given I create a Share Button

  Scenario: Display Network
    When I click the Share Button
    Then I should see the Email button
    When I click the Email button
    Then I should see a new window

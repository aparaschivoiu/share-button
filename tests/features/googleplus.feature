Feature: Google Plus Network

  Background:
    Given I create a Share Button

  Scenario: Display Network
    When I click the Share Button
    Then I should see the Google Plus button
    When I click the Google Plus button
    Then I should see a new window

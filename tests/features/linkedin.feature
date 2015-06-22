Feature: Linkedin Network

  Background:
    Given I create a Share Button

  Scenario: Display Network
    When I click the Share Button
    Then I should see the Linkedin button
    When I click the Linkedin button
    Then I should see a new window

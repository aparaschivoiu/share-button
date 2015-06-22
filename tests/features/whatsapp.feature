Feature: Whatsapp Network

  Background:
    Given I create a Share Button

  Scenario: Display Network
    When I click the Share Button
    Then I should see the Whatsapp button
    When I click the Whatsapp button
    Then I should see a new window

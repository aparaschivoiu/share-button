Feature: Pinterest Network

  Background:
    Given I create a Share Button

  Scenario: Display Network
    When I click the Share Button
    Then I should see the Pinterest button
    When I click the Pinterest button
    Then I should see a new window

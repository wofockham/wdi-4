Feature: Calculator
  As a budding web developer
  I want to figure out Cucumber
  And add some numbers together

  Scenario: Add two numbers together
    Given I have a calculator
    And I have the number 5
    And I have the number 7
    When I add them together
    Then I should see 12 in the terminal

  Scenario: Multiply two numbers together
    Given I have a calculator
    And I have the number 23
    And I have the number 3
    When I multiply them
    Then I should see 69 in the terminal

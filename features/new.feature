Feature: The ehash new command
  I want a command to create a new data file
  So that it can save data

  Scenario: ehash new
    Given ~/ehash.yml does not exist
    When I call the new command without flags
    Then I create a data file at ~/ehash.yml

  Scenario: ehash new -f /tmp/ehash.yml
    Given /tmp/ehash.yml does not exist
    When I call the new command with the file flag
    Then I create a data file at /tmp/ehash.yml

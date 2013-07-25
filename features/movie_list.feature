Feature: Movie list

  Scenario: See list of movies
    Given there is a movies
    When I visit movies page
    Then I should see all movies
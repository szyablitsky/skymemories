Feature: Movie list

  Background: Authorized user
    Given the user has an account
      And the user is signed in

  Scenario: See list of movies
    Given there is a movies
    When I visit movies page
    Then I should see all movies
Feature: Signing out

  Scenario: Successful signout
    Given the user has an account
      And the user is signed in
    When the user signs out
    Then he should see home page
     # And he should see a signin link

@android
Feature: Imdb basic tests
  @current
  
  Scenario: Share a movie with Email
    When user search for movie: "Matrix"
    And user clone ad banner
    Then movie: "Matrix" should be in the results
    Then user should be able to send email to: "devicelab@qualifylabs.com"
Feature: code breakers starts game

	As a code-breakers
	I want to start the game

	Scenario: start game
		Given I am not yet playing
		When I start a new game
		Then I should see "Welcome to CodeBreakers !"
		And I should see "Enter guess:"

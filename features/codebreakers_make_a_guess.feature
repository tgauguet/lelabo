Feature: code-breaker submit a guess 
 code-breakers submits a guess of four numbers. The game marks the guess with + & -

	For each number in the guess that matches the number and position of the number in the secret code, the marks include on + symbol. For each number in the guess that matches the number btu not the position of a number in the secret code, the mark include one - symbol.

	Scenario Outline: submit guess 
		Given the secret code is "<code>"
		When I guess "<guess>"
		Then the mark should be "<mark>"

	Scenarios: no matches
		| code | guess | mark |
		| 1234 | 5555  |      |

	Scenarios: 1 number correct
		| code | guess | mark |
		| 1234 | 1555  | +    |
		| 1234 | 2555  | -    |

	Scenarios: 2 numbers correct
		| code | guess | mark |
		| 1234 | 5254  | ++   |
		| 1234 | 5154  | +-   |
		| 1234 | 2545  | --   |

	Scenarios: 3 numbers correct
		| code | guess | mark |
		| 1234 | 5234  | +++  |
		| 1234 | 5134  | ++-  |
		| 1234 | 5124  | +--  |
		| 1234 | 5123  | ---  |

	Scenarios: All numbers correct
		| code | guess | mark |
		| 1234 | 1234  | ++++ |
		| 1234 | 1243  | ++-- |
		| 1234 | 1342  | +--- |
		| 1234 | 2341  | ---- |


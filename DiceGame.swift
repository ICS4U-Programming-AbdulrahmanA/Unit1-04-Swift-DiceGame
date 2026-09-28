/*
 * The DiceGame program generates a random number from 1 to 6
 * and prompts the user to guess it, giving high/low feedback
 * and tracking guess count safely until correct.
 *
 * @author  Abdul
 * @version 1.0
 * @since   2026-09-25
 */

// Error type for invalid input.
enum GuessError: Error {
	case invalidNumber
}

// Minimum value for dice roll.
let minVal = 1

// Maximum value for dice roll.
let maxVal = 6

// Set target to a random value between min and max.
let targetNumber = Int.random(in: minVal...maxVal)

// Set guess count to 0.
var guessCount = 0

// Set user guess to 0.
var userGuess = 0

// Display welcome message.
print("Welcome to the Dice Guessing Game!")

// Repeat until the user guesses correctly.
while userGuess != targetNumber {
	// Ask the user for a guess.
	print("Guess a number between 1 and 6: ", terminator: "")

	// Read the user's input.
	guard let inputString = readLine() else {
		print("Invalid input! Please enter a valid whole number.")
		break
	}

	// Try to convert the input into an integer.
	do {
		// Give an error if the input is not a whole number.
		guard let guess = Int(inputString) else {
			throw GuessError.invalidNumber
		}

		// Check that the guess is between the minimum and maximum values.
		if guess < minVal || guess > maxVal {
			print("Invalid input! Enter a number between 1 and 6.")
		} else {
			// Set user guess to the input value.
			userGuess = guess

			// Increments guess count.
			guessCount += 1

			// If user value is too low.
			if userGuess < targetNumber {
				print("Too low! Try again.")
            // If user value is too high.
			} else if userGuess > targetNumber {
				print("Too high! Try again.")
            // If user value is correct.
			} else {
				print("Correct! You guessed the right number!")
			}
		}
	} catch GuessError.invalidNumber {
		// Display an error for invalid input.
		print("Invalid input! Please enter a valid whole number.")
	}
}

// Display the final guess count.
print("It took you \(guessCount) guess(es) to get the right answer.")

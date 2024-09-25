# Hangman - Command Line Game

## Overview

This is a Ruby implementation of the classic Hangman game, where the player has to guess a randomly selected secret word. The game is played in the terminal, and the player can save their progress and resume it later.

## Features

- **Word Selection**: The secret word is chosen randomly from a dictionary (`google-10000-english-no-swears.txt`) and contains between 5 to 12 characters.
- **Guess Tracking**: The player has up to 6 incorrect guesses. Each turn displays the current state of the word (e.g., `_ _ e _ r _ t`), as well as the incorrect guesses made so far.
- **Save/Load Functionality**: The player can save their progress at any point and load it later to continue playing from where they left off.
- **User Input**: The game takes letter guesses from the player, ensuring that inputs are valid (single letters, case-insensitive).
- **Colorized Output**: The game enhances the player experience by using colored output (thanks to the `colorize` gem).

## Game Flow

1. **Start the Game**: The player can choose between starting a new game or loading a saved one.
2. **Gameplay**: The player makes guesses to reveal the secret word, with feedback provided after each guess. Incorrect guesses are tracked and displayed.
3. **Win/Loss Conditions**: The player wins if they guess all letters correctly before running out of incorrect guesses. They lose if they make 6 wrong guesses.
4. **Saving**: At any turn, the player can opt to save the game and exit.

## How to Run

1. Clone the repository:

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Run the game:
   ```bash
   bundle exec ruby main.rb
   ```

4. **Optional**: If you don't have the `colorize` gem installed, you can install it with:
   ```bash
   gem install colorize
   ```

## File Structure

```plaintext
hangman/
│
├── lib/
│   ├── dictionary.rb      # Handles dictionary loading and secret word selection
│   ├── game.rb            # Core game logic (play, save, load)
│   ├── player.rb          # Handles player input and validation
│
├── saved_game             # Serialized game state saved here (created after saving)
│
└── main.rb                # Entry point for starting or loading the game
```
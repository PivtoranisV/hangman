# frozen_string_literal: true

class Player
  def make_guess
    loop do
      puts "\nPlease make a guess (single letter, a-z):"
      guess = gets.chomp.downcase
      return guess if valid_guess?(guess)

      puts "\nInvalid input, please enter a single letter (a-z)."
    end
  end

  private

  def valid_guess?(guess)
    guess.length == 1 && guess.match?(/[a-z]/)
  end
end

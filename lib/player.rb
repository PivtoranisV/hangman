# frozen_string_literal: true

require 'colorize'

class Player
  def make_guess
    loop do
      puts "\nPlease make a guess (single letter, a-z):".colorize(:yellow)
      guess = gets.chomp.upcase
      return guess if valid_guess?(guess)

      puts "\nInvalid input, please enter a single letter (a-z).".colorize(:red)
    end
  end

  private

  def valid_guess?(guess)
    guess.length == 1 && guess.match?(/[A-Z]/)
  end
end

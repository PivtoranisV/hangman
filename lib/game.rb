# frozen_string_literal: true

require_relative 'dictionary'
class Game
  def initialize
    puts 'Welcome to Hangman!'
    puts 'Guess the secret word. You have 6 wrong guesses.'
    @secret_word = Dictionary.new.select_secret_word
    @incorrect_guesses = 0
    @correct_guesses = []
    puts display_secret_word_dashes
  end

  private

  def display_secret_word_dashes
    @secret_word.gsub(/[^A-Z\s]/, '_ ')
  end

  def update_display(guess)
    @secret_word.chars.map! { |char| char.include?(guess) ? "#{char} " : '_ ' }.join
  end
end

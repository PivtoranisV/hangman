# frozen_string_literal: true

require_relative 'dictionary'
require_relative 'player'
class Game
  def initialize
    puts 'Welcome to Hangman!'
    puts 'Guess the secret word. You have 6 wrong guesses.'
    @secret_word = Dictionary.new.select_secret_word
    @player = Player.new
    @incorrect_guesses = 0
    @correct_guesses = []
    puts display_secret_word_dashes
  end

  def play
    loop do
      guess = @player.make_guess
      puts update_display(guess)
      @incorrect_guesses += 1 unless @secret_word.include?(guess)
      puts "\nYou can make only #{6 - @incorrect_guesses} wrong guesses"
      break if game_over
    end
  end

  private

  def display_secret_word_dashes
    @secret_word.gsub(/[^A-Z\s]/, '_ ')
  end

  def update_display(guess)
    @correct_guesses << guess if @secret_word.include?(guess)
    @secret_word.chars.map { |char| @correct_guesses.include?(char) ? "#{char} " : '_ ' }.join
  end

  def game_over
    if @incorrect_guesses == 6
      puts "Game over! The word was: #{@secret_word}"
      true
    elsif @secret_word.chars.all? { |char| @correct_guesses.include?(char) }
      puts "Congratulations, you've won! The word was: #{@secret_word}"
      true
    else
      false
    end
  end
end

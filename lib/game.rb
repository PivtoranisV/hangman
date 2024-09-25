# frozen_string_literal: true

require_relative 'dictionary'
require_relative 'player'
require 'colorize'
class Game
  def initialize
    puts '========'
    puts 'Hangman!'.colorize(:blue)
    puts '========'
    puts "\nGuess the secret word. You have 6 wrong guesses.\n".colorize(:yellow)
    @secret_word = Dictionary.new.select_secret_word
    @player = Player.new
    @incorrect_guesses = 0
    @correct_guesses = []
    puts display_secret_word_dashes
  end

  def play
    loop do
      guess = @player.make_guess
      puts "\n"
      if @correct_guesses.include?(guess)
        puts "You've already guessed '#{guess}'".colorize(:green)
        next
      end
      puts update_display(guess)
      @incorrect_guesses += 1 unless @secret_word.include?(guess)
      break if game_over

      puts "\nYou can make only #{6 - @incorrect_guesses} wrong guesses".colorize(:blue)
    end
  end

  private

  def display_secret_word_dashes
    @secret_word.gsub(/[^a-z\s]/, '_ ').colorize(:green)
  end

  def update_display(guess)
    @correct_guesses << guess if @secret_word.include?(guess)
    @secret_word.chars.map { |char| @correct_guesses.include?(char) ? "#{char} " : '_ ' }.join
  end

  def game_over
    if @incorrect_guesses == 6
      puts "\nGame over! The word was: #{@secret_word}".colorize(:red)
      true
    elsif @secret_word.chars.all? { |char| @correct_guesses.include?(char) }
      puts "\nCongratulations, you've won! The word was: #{@secret_word}".colorize(:green)
      true
    else
      false
    end
  end
end

# frozen_string_literal: true

require_relative 'dictionary'
require_relative 'player'
require 'colorize'
class Game
  def initialize
    puts "\nGuess the secret word. You have 6 wrong guesses.\n".colorize(:yellow)
    @secret_word = Dictionary.new.select_secret_word
    @player = Player.new
    @incorrect_guesses = 0
    @correct_guesses = []
    @incorrect_guesses_list = []
    puts display_secret_word_dashes
  end

  def play
    loop do
      puts "\nDo you want to (1) make a guess or (2) save the game?".colorize(:yellow)
      choice = gets.chomp

      if choice == '2'
        save_game
        puts "\nGame saved!".colorize(:green)
        break
      end
      guess = @player.make_guess
      puts "\n"
      if @correct_guesses.include?(guess) || @incorrect_guesses_list.include?(guess)
        puts "You've already guessed '#{guess}'".colorize(:green)
        next
      end
      puts update_display(guess)
      @incorrect_guesses += 1 unless @secret_word.include?(guess)
      break if game_over

      puts "\nYou can make only #{6 - @incorrect_guesses} wrong guesses".colorize(:blue)
    end
  end

  def self.load_game
    if File.exist?('saved_game')
      File.open('saved_game') do |file|
        return Marshal.load(file)
      end
    else
      puts "\nNo saved game found".colorize(:red)
      nil
    end
  end

  def self.start
    puts '========'
    puts 'Hangman!'.colorize(:blue)
    puts '========'
    puts 'Would you like to (1) start a new game or (2) load a saved game?'.colorize(:yellow)
    choice = gets.chomp

    if choice == '2'

      game = load_game
      if game
        puts "\nYour saved game load successfully, continue to play".colorize(:green)
        game.play
      else
        puts "\nNew game started".colorize(:green)
        Game.new.play
      end
    else
      puts "\nNew game started".colorize(:green)
      Game.new.play
    end
  end

  private

  def display_secret_word_dashes
    @secret_word.gsub(/[^a-z\s]/, '_ ').colorize(:green)
  end

  def update_display(guess)
    @correct_guesses << guess if @secret_word.include?(guess)
    @incorrect_guesses_list << guess unless @secret_word.include?(guess)

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

  def save_game
    File.open('saved_game', 'w') do |file|
      Marshal.dump(self, file)
    end
  end
end

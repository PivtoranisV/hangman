# frozen_string_literal: true

class Player
  def make_guess
    puts 'Please, make a guess of a letter'
    gets.chomp.downcase
  end
end

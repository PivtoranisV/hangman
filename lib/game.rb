# frozen_string_literal: true

class Game
  def load_dictionary
    File.open('dictionary.txt') do |file|
      file.readlines.map(&:chomp)
    end
  end
end

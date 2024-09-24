# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/player'
g = Game.new
words = g.load_dictionary
puts words.first

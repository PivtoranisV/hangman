# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/dictionary'

d = Dictionary.new
words = d.load_dictionary
puts words.first

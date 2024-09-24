# frozen_string_literal: true

class Dictionary
  def load_dictionary
    File.open('dictionary.txt') do |file|
      file.readlines.map(&:chomp)
    end
  end
end

# frozen_string_literal: true

class Dictionary
  def select_secret_word
    words = load_dictionary
    words.select { |word| word.length.between?(5, 12) }.sample.downcase
  end

  private

  def load_dictionary
    File.open('dictionary.txt') do |file|
      file.readlines.map(&:chomp)
    end
  end
end

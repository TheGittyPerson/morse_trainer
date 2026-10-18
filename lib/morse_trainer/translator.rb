# frozen_string_literal: true

# Contains morse code translating functionality
module Translator
  MORSE_TABLE = {
    "a" => ".-",   "b" => "-...", "c" => "-.-.", "d" => "-..",
    "e" => ".",    "f" => "..-.", "g" => "--.",  "h" => "....",
    "i" => "..",   "j" => ".---", "k" => "-.-",  "l" => ".-..",
    "m" => "--",   "n" => "-.",   "o" => "---",  "p" => ".--.",
    "q" => "--.-", "r" => ".-.",  "s" => "...",  "t" => "-",
    "u" => "..-",  "v" => "...-", "w" => ".--",  "x" => "-..-",
    "y" => "-.--", "z" => "--..",

    "1" => ".----", "2" => "..---", "3" => "...--", "4" => "....-",
    "5" => ".....", "6" => "-....", "7" => "--...", "8" => "---..",
    "9" => "----.", "0" => "-----",

    "." => ".-.-.-",  "," => "--..--", "?" => "..--..", "'" => ".----.",
    "!" => "-.-.--",  "/" => "-..-.",  "(" => "-.--.",  ")" => "-.--.-",
    "&" => ".-...",   ":" => "---...", ";" => "-.-.-.", "=" => "-...-",
    "+" => ".-.-.",   "-" => "-....-", "_" => "..--.-", '"' => ".-..-.",
    "$" => "...-..-", "@" => ".--.-."
  }.freeze

  refine ::String do
    # Converts to the Morse equivalent of the string
    # If +replace_unknown_with+ is +nil+, raises an error on an unrecognized
    # character; otherwise, the given string is used.
    # @param space [String] default = " / "
    # @param replace_unknown_with [String] default = +nil+
    # @return [String]
    def to_morse(space: "/", replace_unknown_with: nil)
      morse_table = MORSE_TABLE.merge({ " " => space })
      each_char.map do |char|
        if morse_table.include?(char.downcase)
          morse_table.fetch(char.downcase, char) + " "
        else
          if replace_unknown_with.nil?
            raise ArgumentError, "Cannot convert '#{char}' to Morse"
          end
          replace_unknown_with + " "
        end
      end.join.strip
    end

    # Converts from Morse.
    # Raises +ArgumentError+ on an invalid character or sequence.
    # " / " is a space.
    # If +replace_unknown_with+ is +nil+, raises an error on an invalid
    # sequence; otherwise, the given string is used.
    # @param space [String] default = " / "
    # @param replace_invalid_with [String] default = +nil+
    # @return [String]
    def from_morse(space: "/", replace_invalid_with: nil)
      words = split(space)
      letters_each_words = words.map(&:split)
      morse_table = MORSE_TABLE.invert

      letters_each_words.map do |letters_in_word|
        letters_in_word.reduce("") do |whole, letter|
          whole + morse_table.fetch(letter) do
            if replace_invalid_with.nil?
              raise ArgumentError, "Invalid Morse sequence '#{letter}'"
            end
            replace_invalid_with
          end
        end
      end.join(" ")
    end
  end
end

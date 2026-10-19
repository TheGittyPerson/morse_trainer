# frozen_string_literal: true

require "rainbow/refinement"

# UI utilities for output text
module UIUtils
  using Rainbow

  # Outputs formatted error message. Exits with code 1 if +kill+ is true.
  # @param msg [String]
  # @param kill [Boolean]
  # @param newline [Boolean]
  def error(msg, kill: true, newline: true)
    puts if newline
    puts "Error: ".bold.red + msg.to_s
    exit 1 if kill
  end

  # Get validated user input.
  # @param prompt [String]
  # @param allowed [Array<String>, String]
  # @param error_msg [String, nil]
  # @return [String]
  def input(prompt, allowed: [], error_msg: nil)
    allowed = allowed.chars if allowed.is_a? String
    loop do
      print prompt
      resp = gets.chomp.strip

      return resp if allowed.empty? || allowed.include?(resp.downcase)

      error error_msg || "Enter #{join_with_or(allowed)}", kill: false
    end
  end

  # Join a list with commas and the last two elements with "or".
  # @param arr [Array, String]
  # @return String
  def join_with_or(arr)
    arr = arr.split if arr.is_a? String
    return "" if arr.empty?
    return arr.first.to_s if arr.length == 1

    "#{arr[0..-2].join(", ")} or #{arr.last}"
  end
end

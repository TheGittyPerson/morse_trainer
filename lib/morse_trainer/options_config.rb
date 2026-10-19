# frozen_string_literal: true

require "json"

require_relative "ui_utils"

# Manages configuration and stores options for a session.
class OptionsConfig
  include UIUtils

  attr_accessor :options, :setting_default

  def initialize
    @path = Pathname.new("~/.config/morse_trainer/config.json").expand_path
    @default = {
      speed: 15.0,
      rounds: -1,
      ansi: true,
      silent: false
    }
    @options = @default.dup
    save_json unless @path.exist?
    load_json
    @setting_default = false
  end

  # Sets an option to the given value and returns it.
  # Outputs an error message and exits with code 1 on an invalid value.
  # @param option [Symbol]
  # @param value [T]
  # @return [T]
  def set_option(option, value)
    case option
    when :speed
      unless [Integer, Float].include?(value.class) && (5..75).cover?(value)
        error "Speed must be between 5 and 75 WPM, inclusive"
      end
    when :rounds
      unless value.is_a?(Integer) && (value.positive? || value == -1)
        error "Rounds must be a positive integer or -1"
      end
    when :ansi
      error "ANSI must be true or false" unless [true, false].include? value
    when :silent
      error "Silent must be true or false" unless [true, false].include? value
    else
      error "Unknown option to set: #{option}"
    end

    @options[option] = value
    save_json if @setting_default
    value
  end

  # Sets an option to the given value and also saves it to the config file.
  # This new value will now be used by default in the future. Returns this
  # new value.
  # @param option [Symbol]
  # @param value [T]
  # @return [T]
  def set_default(option, value)
    set_option(option, value)
    puts "#{option} set to #{value} as default"
    save_json
    value
  end

  # Reset options to original default values and saves to the config file.
  def reset_options
    @options = @default.dup
    save_json
    puts "Default options reset to original values.\n\n"
    view_all
  end

  # Get the value for an option.
  # Outputs an error message and exits on an unknown option.
  # @param option [Symbol]
  # @return [Object]
  def get(option)
    @options[option]
  rescue KeyError
    error "Unknown option to get: #{option}"
  end

  # Gets an option value and outputs it.
  # Outputs an error message and exits on an unknown option.
  # @param option [Symbol]
  def view(option)
    error "Unknown option to view: #{option}" unless @options.key? option
    p get option
  end

  # Outputs all option values and calls +exit+
  def view_all
    opt_just = @options.keys.max_by(&:length).length
    val_just = @options.values.map(&:to_s).max_by(&:length).length
    @options.each do |option, value|
      print "#{option.to_s.ljust opt_just}: #{value.inspect.rjust val_just} "
      if value == @default[option]
        puts "(default)"
      else
        puts "(default = #{@default[option].inspect})"
      end
    end
    exit
  end

  private

  # Loads config JSON into runtime to use as default options.
  # Checks for any invalid keys in the JSON. Outputs an error message and 
  # exits if present.
  def load_json
    @options = JSON.parse(@path.read, symbolize_names: true)
    @options.each_key do |key|
      unless @default.key? key
        error "Unknown option to load from config file: #{key}"
      end
    end
  end

  # Save options to the JSON file to use as default options.
  def save_json
    @path.dirname.mkpath unless @path.dirname.exist?
    @path.write(JSON.pretty_generate(@options))
  end
end

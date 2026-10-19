# frozen_string_literal: true

require "optparse"

require_relative "version"
require_relative "ui_utils"

# Parses arguments and calls methods accordingly
class ArgParser
  include UIUtils

  attr_accessor :parser

  # @param config [OptionsConfig]
  def initialize(config)
    @parser = OptionParser.new do |opts|
      opts.banner = "Usage: morse_trainer [options]"

      opts.on("-c", "--set-default", "--config",
              "Sets other passed options as defaults") do
        config.setting_default = true
      end

      opts.on("-r", "--reset", "Reset default options to original values") do
        config.reset_options
      end

      opts.on("-s", "--silent", "Output Morse code as text instead of sound") do
        config.set_option(:silent, true)
      end

      opts.on("--[no-]color", "Toggle ANSI-colored text") do |bool|
        config.set_option(:color, bool)
      end

      opts.on("-s", "--speed [WPM]", Integer,
              "Set playback speed in words per minute") do |speed|
        if speed.nil?
          p config.get :speed
          exit
        end
        config.set_option(:speed, speed)
      end

      opts.on("-n", "--rounds [COUNT]", Integer,
              "Set the number of practice rounds") do |rounds|
        config.set_option(:rounds, rounds)
      end

      opts.on("-h", "--help", "Show this help message") do
        puts opts
        exit
      end

      opts.on("-v", "--version", "Show the app version") do
        puts MorseTrainer::VERSION
        exit
      end
    end
  end

  # Reads arguments, deals with flags and options, and removes them from +ARGV+.
  # @return Array[String]
  def parse
    @parser.parse!
    # TODO: Add rules to handle invalid option combos
  rescue OptionParser::ParseError => e
    error e.message, kill: false
    warn parser
    exit 1
  end
end

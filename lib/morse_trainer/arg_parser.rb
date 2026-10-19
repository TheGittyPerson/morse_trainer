# frozen_string_literal: true

require "optparse"

require_relative "version"
require_relative "ui_utils"

# Parses arguments and calls methods accordingly
class ArgParser
  include UIUtils

  attr_accessor :opt_parser

  # @param config [OptionsConfig]
  def initialize(config)
    @opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: morse_trainer [options]"

      opts.on("-r", "--reset", "Reset default options to original values") do
        config.reset_options
      end

      opts.on("-d", "--set-default",
              "Sets other passed options as defaults") do
        config.setting_default = true
      end

      opts.on("-s", "--[no-]silent",
              "Toggle Morse code output as text (silent) or sound") do |bool|
        config.set_option(:silent, bool)
      end

      opts.on("--[no-]ansi", "Toggle ANSI-styled text") do |bool|
        config.set_option(:ansi, bool)
      end

      opts.on("-s", "--speed [WPM]", Float,
              "Set playback speed in words per minute") do |speed|
        if speed.nil?
          config.view :speed
          exit
        else
          config.set_option(:speed, speed)
        end
      end

      opts.on(
        "-n", "--rounds [COUNT]", Integer,
        "Set the number of practice rounds. Pass -1 to do indefinite rounds."
      ) do |rounds|
        if rounds.nil?
          config.view :rounds
          exit
        end
        config.set_option(:rounds, rounds)
      end

      opts.on("-c", "--all-configs", "Show all default option values") do
        config.view_all
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
    @opt_parser.parse!
    # TODO: Add rules to handle invalid option combos
  rescue OptionParser::ParseError => e
    error e.message, kill: false
    puts
    warn @opt_parser
    exit 1
  end
end

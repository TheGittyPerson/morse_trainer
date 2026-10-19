# frozen_string_literal: true

require_relative "morse_trainer/trainer"
require_relative "morse_trainer/arg_parser"
require_relative "morse_trainer/options_config"

# Core MorseTrainer class
module MorseTrainer
  class Error < StandardError; end

  # Main run loop
  # @param args Array[String]
  def self.run
    config = OptionsConfig.new
    pos_args = ArgParser.new(config).parse
    Trainer.new(pos_args, config)
  end
end

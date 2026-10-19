# frozen_string_literal: true

# Trainer class to manage training loop
class Trainer
  # @param pos_args [Array<String>]
  # @param config [OptionsConfig]
  def initialize(pos_args, config)
    @pos_args = pos_args
    @config = config
  end
end

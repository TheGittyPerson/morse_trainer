# frozen_string_literal: true

# Trainer class to manage training loop
class Trainer
  # @param pos_args [Array<String>]
  # @param config [OptionsConfig]
  def initialize(pos_args, config)
    @pos_args = pos_args
    @config = config
  end

  def start_training
    rounds = @config.get(:rounds)
    if rounds == -1
      loop do
        if @config.get(:silent)
          start_audio_round
        else
          start_text_round
        end
      end
    else
      rounds.times do
        if @config.get(:silent)
          start_audio_round
        else
          start_text_round
        end
      end
    end
  end

  private

  def start_audio_round
    puts "Training (audio):"
    puts "- Speed: #{@config.get(:speed)} WPM"
    print "Wanna quit?: "
    exit if gets.chomp.downcase == "y"
  end

  def start_text_round
    puts "Training (text):"
    puts "- Speed: #{@config.get(:speed)} WPM"
    print "Wanna quit?: "
    exit if gets.chomp.downcase == "y"
  end
end

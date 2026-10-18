# frozen_string_literal: true

require_relative "lib/morse_trainer/version"

Gem::Specification.new do |spec|
  spec.name = "morse_trainer"
  spec.version = MorseTrainer::VERSION
  spec.authors = ["Morpheus"]
  spec.email = ["167074500+TheGittyPerson@users.noreply.github.com"]

  spec.summary = "Practice listening to and understanding Morse code."
  spec.homepage = "https://github.com/TheGittyPerson/morse_trainer"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.3.0"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z],
                        chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore .rubocop.yml])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end

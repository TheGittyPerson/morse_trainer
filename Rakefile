# frozen_string_literal: true

require "bundler/gem_tasks"
require "bundler/setup"
require "rubocop/rake_task"
require "rake/testtask"

RuboCop::RakeTask.new
Bundler::GemHelper.install_tasks

Rake::TestTask.new do |t|
  t.libs << "test"
end

desc "Run tests"
task default: :test

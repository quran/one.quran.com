require_relative 'config/application'

Rails.application.load_tasks

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new

  task default: [:spec, :rubocop]
rescue LoadError # rubocop:disable Lint/HandleExceptions
end

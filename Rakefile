task :run => [:environment] do
  OrderController.new.create_order_batch
end

task :test => [:environment] do
  RSpec::Core::RakeTask.new(:spec)
  RSpec::Core::Runner.run(['spec'])
end

task :environment do
  require 'pry'
  require 'csv'
  require 'rspec'
  require 'tempfile'
  require 'rspec/core/rake_task'

  lib = File.expand_path('../lib', __FILE__)
  $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
  Dir['./lib/*.rb'].each { |file| require file }
end

#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'

desc "Run Specs"
Rake::TestTask.new do |t|
  t.pattern = "spec/**/*.rb"
end

task :default => :test

require 'rubygems'
require 'bundler'

Bundler.require

app_base = "#{File.dirname(File.expand_path(__FILE__))}"

Dir.glob("#{app_base}/apis/**/*.rb").each { |i| require i }
Dir.glob("#{app_base}/models/**/*.rb").each { |i| require i }
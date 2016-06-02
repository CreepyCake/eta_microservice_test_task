require 'ostruct'
require 'pathname'
require 'bundler'

# Load environment settings
Config = OpenStruct.new
Config.env = ENV['RACK_ENV'] ? ENV['RACK_ENV'].to_sym : :development
Config.root = Pathname.new(File.expand_path('../..', __FILE__))

Bundler.require(:default, Config.env)

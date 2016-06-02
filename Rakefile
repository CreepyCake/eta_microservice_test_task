require 'bundler/setup'
require 'grape/activerecord/rake'

#Grape::ActiveRecord.configure_from_file! "config/database.yml"

namespace :db do
  task :environment do
    require_relative 'config/application'
  end
end
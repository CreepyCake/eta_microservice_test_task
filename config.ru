require 'rack'
require 'rubygems'
require 'bundler/setup'
require 'grape'
require './app/core'
require './config/application'

use ActiveRecord::ConnectionAdapters::ConnectionManagement

run Cars
# = get bundler loaded
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
require './app'

# main app
map '/' do
  run App
end

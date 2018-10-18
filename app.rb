require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'open-uri'
require 'views/index'

ind_object = Index.new


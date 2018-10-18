require 'bundler'
Bundler.require
require 'townhalls_follower'
$:.unshift File.expand_path("./../lib", __FILE__)
require 'open-uri'
require 'views/index'

#ind_object = Index.new

TwitterBot.new.find_save_townhall_twitter_handle

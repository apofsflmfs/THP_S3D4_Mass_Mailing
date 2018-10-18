require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'open-uri'
require 'app/townhalls_scrapper'
require 'app/townhalls_adder_to_db'


scrapper_array = []

scrapper_array << Scrapper.new("Herault", "http://annuaire-des-mairies.com/herault.html", "34")
# scrapper_array << Scrapper.new("Gard", "http://annuaire-des-mairies.com/gard.html", "30")
# scrapper_array << Scrapper.new("Aude", "http://annuaire-des-mairies.com/aude.html", "11")
# scrapper_array << Scrapper.new("Pyrénées-Atlantiques", "http://annuaire-des-mairies.com/pyrenees-atlantiques.html", "64")
# scrapper_array << Scrapper.new("Pyrénées-Atlantiques", "http://annuaire-des-mairies.com/pyrenees-atlantiques-2.html", "64")



Dumper.new(scrapper_array)



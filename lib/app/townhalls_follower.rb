require 'twitter'
require 'csv'
require 'dotenv'

# Appelle le fichier .env grâce à la gem dotenv, et enregistre toutes les données enregistrées dans une hash ENV
Dotenv.load

class TwitterBot
	def initialize
		@client = Twitter::REST::Client.new do |config|
		  config.consumer_key = ENV['TWITTER_API_KEY']
		  config.consumer_secret = ENV['TWITTER_API_SECRET']
		  config.access_token = ENV['TWITTER_ACCESS_TOKEN']
		  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_ACCESS']
		end
		search_save_twitter_hundle
	end

	def find_save_townhall_twitter_handle

		csv_content = []

		CSV.foreach('db/townhalls.csv') do |row|
	 		csv_content << row
		end
	
		csv_content.map! do |row|
			puts "recherche du compte tweeter de la ville #{row[0]}"
			search_result = @client.user_search("ville de #{row[0]}")
			townhall_screen_name = " "
				if search_result.first
					puts townhall_screen_name = search_result.first.screen_name
					if townhall_screen_name != " "
						row << "@#{townhall_screen_name}"
					else
						row << " "
					end
				end
			CSV.open('db/townhalls.csv', 'wb') do |csv|
				csv_content.each do |content|
					csv << content
				end
 			end
		end
	end

	def follow_townhall_twitter

		csv_content = []

		CSV.foreach('db/townhalls.csv') do |row|
	 		csv_content << row
		end

		csv_content.each do |townhall_screen_name|
		@client.follow(townhall_screen_name)
		end
	end
end
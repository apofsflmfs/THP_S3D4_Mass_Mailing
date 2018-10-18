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
	end

	def search_save_twitter_handle
		csv_content = []

		CSV.foreach('db/townhalls.csv') do |row|
	 		csv_content << row
		end
	
		csv_content.map! do |row|
			print "recherche du compte Twitter de la ville #{row[0]}"
			search_result = @client.user_search("ville de #{row[0]}")
			townhall_screen_name = " "
			if search_result.first
				townhall_screen_name = search_result.first.screen_name
        puts "=> @#{townhall_screen_name}"
        row << "@#{townhall_screen_name}"
      else
        puts "...rien..."
				row << " "
			end
		end

    csv_content.each do |content|
      puts content
    end

		CSV.open('db/townhalls.csv', 'wb') do |csv|
			csv_content.each do |content|
				csv << content
			end
 		end
	end

	def follow_townhall_twitter
    csv_content = []
    CSV.foreach('db/townhalls.csv') do |row|
      csv_content << row
    end

		csv_content.each do |content_row|
      if content_row[3] == " "
        puts "#{content_row[0]} => pas de compte de Twitter"
      else
				@client.follow(content_row[3][1..-1])
        puts "#{content_row[0]} => ok follow #{content_row[3]}"
      end
		end
	end
end
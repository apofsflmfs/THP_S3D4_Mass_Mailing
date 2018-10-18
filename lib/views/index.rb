$:.unshift File.expand_path("./../lib", __FILE__)
require 'open-uri'
require 'app/townhalls_scrapper'
require 'app/townhalls_adder_to_db'
require 'app/townhalls_follower'
require 'app/townhalls_mailer'
require 'pry'

class Index

  def initialize
  @scrapping_array = []
  menu

  end

  def menu
    stay = true
    state = []
    while stay
      system "clear" or system "cls"
      puts "Liste des tâches déjà effectuées:"
      puts state.join(" - ")
      puts
      puts "************"
      puts "*   MENU   *"
      puts "************"
      puts
      puts "Bonjour, quelle action souhaitez-vous effectuer?"
      puts "1-> scrapper les emails des mairies de l'Hérault?"
      puts "2-> scrapper les emails des mairies du Gard?"
      puts "3-> scrapper les emails des mairies des Pyrénées-Atlantiques?"
      puts
      puts "4-> Inscrire les scrap déjà faits dans un CSV?"
      puts
      puts "5-> Envoyer des emails automatisés aux mairies à partir du CSV créé."
      puts
      puts "6-> Compléter le CSV avec les comptes twitter des mairies et les follow? (Nécessite un .env fonctionnel)"
      puts
      puts "99-> SORTIR"
      puts
      print">>"
      input = gets.chomp.to_i

      case input
      when 1
        # @scrapping_array << Scrapper.new("Herault", "http://annuaire-des-mairies.com/herault.html", "34")
        
        @scrapping_array << Scrapper.new("Réunion", "https://www.annuaire-des-mairies.com/reunion.html", "974")

        state[0] ="Emails de l'Hérault => scrapés"
      when 2
        # @scrapping_array << Scrapper.new("Gard", "http://annuaire-des-mairies.com/gard.html", "30")
        @scrapping_array << Scrapper.new("Guyane", "https://www.annuaire-des-mairies.com/guyane.html", "973")
        
        state[1] = "Emails du Gard => scrapés"

      when 3
        # @scrapping_array << Scrapper.new("Pyrénées-Atlantiques", "http://annuaire-des-mairies.com/pyrenees-atlantiques.html", "64")
        @scrapping_array << Scrapper.new("Martinique", "https://www.annuaire-des-mairies.com/martinique.html", "972")

        state[2] = "Emails des Pyrénées-Atlantiques => scrapés"

      when 4
        @dump = Dumper.new(@scrapping_array)
        state[3] = "CSV créé dans db/townhalls.csv"
      when 5
        # Ligne de commande à rajouter
        state[4] = "Emails envoyés"

      when 6
        TwitterBot.new
        state[5] = "Comptes Twitter rajoutés et follow"

      when 99
        stay = false
      else
        puts 
        puts "***Mauvaise saisie. Merci de recommencer***"
        puts
      end
    end
  end

end

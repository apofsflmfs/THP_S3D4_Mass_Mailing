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
    state = [[1,""],[2,""],[3,""],[4,""],[5,""],[6,""],[7,""]]
    puts state[0][1] = "1-> SCRAP - Scrapper les emails des mairies de l'Hérault?"
    puts state[1][1] = "2-> SCRAP - Scrapper les emails des mairies du Gard?"
    puts state[2][1] = "3-> SCRAP - Scrapper les emails des mairies des Pyrénées-Atlantiques?"
    puts
    puts state[3][1] = "4-> DUMP CSV - Inscrire les scrap déjà faits dans un CSV?"
    puts
    puts state[4][1] = "5-> MAILING - Envoyer des emails automatisés aux mairies à partir du CSV créé."
    puts
    puts state[5][1] = "6-> TWITTER - Compléter le CSV avec les comptes twitter des mairies? (Nécessite un .env fonctionnel)"
    puts state[6][1] = "7-> TWITTER - Follow les comptes des mairies inscrits au CSV? (Nécessite un .env fonctionnel)"

    while stay
      system "clear" or system "cls"
      puts "************"
      puts "*   MENU   *"
      puts "************"
      puts
      puts "Bonjour, quelle action souhaitez-vous effectuer?"
      puts
      puts state[0][1]
      puts state[1][1]
      puts state[2][1]
      puts
      puts state[3][1]
      puts
      puts state[4][1]
      puts
      puts state[5][1]
      puts state[6][1]
      puts
      puts "99-> SORTIR"
      puts
      print">votre choix>"
      input = gets.chomp.to_i

      case input
      when state[0][0]
        # @scrapping_array << Scrapper.new("Herault", "http://annuaire-des-mairies.com/herault.html", "34")
        
        @scrapping_array << Scrapper.new("Réunion", "https://www.annuaire-des-mairies.com/reunion.html", "974")

        state[0][1] = state[0][1][4..-1]+" => FAIT"
        state[0][0] = "azertyuiop"
      when state[1][0]
        # @scrapping_array << Scrapper.new("Gard", "http://annuaire-des-mairies.com/gard.html", "30")
        @scrapping_array << Scrapper.new("Guyane", "https://www.annuaire-des-mairies.com/guyane.html", "973")
        
        state[1][1] = state[1][1][4..-1]+" => FAIT"
        state[1][0] = "azertyuiop"

      when state[2][0]
        # @scrapping_array << Scrapper.new("Pyrénées-Atlantiques", "http://annuaire-des-mairies.com/pyrenees-atlantiques.html", "64")
        @scrapping_array << Scrapper.new("Martinique", "https://www.annuaire-des-mairies.com/martinique.html", "972")

        state[2][1] = state[2][1][4..-1]+" => FAIT"
        state[2][0] = "azertyuiop"


      when state[3][0]
        @dump = Dumper.new(@scrapping_array)
        state[3][1] = state[3][1]+" => FAIT"


      when state[4][0]
        Mailer.new.send_email
        state[4][1] = state[4][1][4..-1]+" => FAIT"
        state[4][0] = "azertyuiop"

      when state[5][0]
        TwitterBot.new #à changer
        state[5][1] = state[5][1]+" => FAIT"

      when state [6][0]
        TwitterBot.new #à changer
        state[6][1] = state[6][1][4..-1]+" => FAIT"
        state[6][0] = "azertyuiop"

      when 99
        stay = false
      else
        puts 
        print "***Mauvaise saisie. Merci de recommencer***"
        gets.chomp
      end
    end
  end

end

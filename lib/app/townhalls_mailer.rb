

require 'csv'
require 'gmail'

	def send_email
		
			csv_content = []
			CSV.foreach('townhalls.csv') do |row|
			csv_content << row
			end

		    mail_subject = "Time to join the Futur !!" 
		    gmail = Gmail.connect!("team.montpellier.thp@gmail.com","Azertypoiuyt55")
		  
			  csv_content.each do |row|
				gmail.deliver do
				  to row[1]
				  subject mail_subject
				  text_part do
				    body "Bonjour,
		Je m'appelle Albator, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de notre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.
		Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de #{row[0]} veut changer le monde avec nous ?
		Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"
			  end
			end
		end

	end
send_email
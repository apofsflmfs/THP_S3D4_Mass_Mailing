require 'google/apis/gmail_v1'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'
require 'gmail'
require 'mail'


	



def send_email(email_adress,email_subject,email_content,input_username,input_password)
  connect = ""
  Gmail.connect(input_username, input_password) do |gmail|
  	connect = gmail.logged_in?
  end
    if  connect == true
  	  puts "vous êtes connecté à votre comte gmail"
    else
  	  puts "votre connection à échouée"
  	end

  gmail = Gmail.connect!(input_username,input_password)
	gmail.deliver do
	  to email_adress
	  subject email_subject
	  text_part do
	    body email_content
	  end
	end
end


def perform
	mail_subject = "Time to join the Futur !!" 
	mail_content = "Bonjour,
Je m'appelle Albator, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de ntore école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.
Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de #{ville} veut changer le monde avec nous ?
Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"


	puts "veuillez entrer votre username:"
	print ">"
	input_username = gets.chomp
	puts "veuillez entrer votre password:"
	print">"
	input_password = gets.chomp

	adress_mail = ""
	commune = ""

	csv.each do |email,ville|
		adress_mail = email
		commune = ville
	send_email(adress_mail,mail_subject,mail_content,input_username,input_password)
    end
		
end
perform

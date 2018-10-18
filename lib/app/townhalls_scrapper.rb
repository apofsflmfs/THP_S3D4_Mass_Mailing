require 'csv'

class Scrapper
attr_reader :email_hash, :department_name

  def initialize(name,url, number)
    @email_hash = Hash.new
    @department_name = name
    @department_url = url
    @department_num = number
    @department_url_array = []
    @department_url_array << @department_url

    list_all_department_url
    perform
  end

  #programme un peu lent, le temps de recup les données sur les divers sites internet
  #fonction qui va chercher l'adresse mail sur le site
  def get_the_email_of_a_townhal_from_its_webpage(url)
    line = "*"*80
    begin
    mairie = Nokogiri::HTML(open(url))
    rescue
      puts line
      puts "Une page retourne une erreur 404"
    end
    # .css ou .xpath est la meme chose, la gem fais le lien.
    begin
    mail = mairie.css("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
    #return mail.text car sinon, on recupere le path du mail.
    puts mail.text
    return mail.text
    rescue
      puts line
      puts "Pas d'email du à l'erreur 404"
    end
  end

  #fonction qui recupere tous les liens vers les mairies du val d'oise
  def get_all_the_urls_of_department_townhalls(dep_url)
    
  #on recupere tout le code de annuaire...
    department_page = Nokogiri::HTML(open("#{dep_url}"))
    #tout les a des communes
    a_des_communes = department_page.css("a")
    a_des_communes.each_with_index do |a_d_une_commune|
      #tout les href des communes
      url_commune = a_d_une_commune['href']
      #on recup tout les url qui contiennent 34
      if url_commune.include? "/#{@department_num}/"
        mairie_name = a_d_une_commune.text #on recup le texte "nom de commune"
        # ensuite on change le . par https://...com
        url_commune[0] = "http://annuaire-des-mairies.com"
        # et on envoie l'adresse dans la fonction pour recup l'adresse mail 
        mairie_mail = get_the_email_of_a_townhal_from_its_webpage(url_commune) 
        # et ensuite on rempli notre hash avec nom et mail
        @email_hash[mairie_name] = mairie_mail
      end
    end
  end

  def perform
    line = "*"*80
    puts line
    puts "***Lancement du scrap sur le département #{@department_name}...***"
    @department_url_array.each do |url|
      get_all_the_urls_of_department_townhalls(url)
    end

    puts line
    puts "***Fin du scrap sur le département #{@department_name}...***"
    puts

  end

  def list_all_department_url
    more_urls = true
    i = 1
    while(more_urls)
      i += 1
      index_to_update = @department_url =~ /.html/
      begin
        page = Nokogiri::HTML(open("#{other_url}"))
      rescue
        puts 
        more_urls = false
      end
      if page
        @department_url_array << other_url
      end
    end
  end
end

class Dumper
  attr_reader :scrapper_array

  def initialize(scrapper_array)
    @scrapper_array = scrapper_array
    export_csv
  end

   def export_csv
    CSV.open("db/townhalls.csv", "wb") do |csv|
      @scrapper_array.each do |scrapper|
        scrapper.email_hash.each do |townhall_name, townhall_email|
          csv << [townhall_name, townhall_email, scrapper.department_name]
        end
      end
    end
  end



end
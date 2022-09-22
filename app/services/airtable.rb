require 'net/http'

class Airtable
  def self.call(save = true)
    url = URI('https://api.airtable.com/v0/appAbQU93hLi0h1Nv/Table%201')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request['Authorization'] = "Bearer #{ENV['AIRTABLE_API_KEY']}"
    response = http.request(request)
    body = response.read_body

    if save
      File.open('copy.json', 'w') do |f|
        f.write(body)
      end
    else
      body
    end
  rescue Exception => e
    puts 'Exception: ' + e.message
  end
end

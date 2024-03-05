require 'net/http'

class ApiConnection
  def connect
    uri = URI('https://api.mymemory.translated.net/')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    http
  end
end

puts "jovem amigo"
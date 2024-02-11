require 'json'
require_relative 'api_connection'
require_relative 'file_controller'

class TranslateApp
  def initialize
    @connection = ApiConnection.new
    @file_controller = File_controller.new
  end

  def make_questions
    puts "Selecione as opções:"
    print "Escolha o texto para ser traduzido: "

    @text = gets.chomp

    print "Escolha o idioma: "

    @language = gets.chomp
  end

  def translate
    http = @connection.connect

    response = http.get("/get?q=#{@text.gsub(/\s+/, '_')}&langpair=pt|#{@language}")
    hash = JSON.parse(response.body)

    if response.code == '200'
      hash.each do |key, value|
        puts "#{key}: #{value}"
      end
      response_data = hash["responseData"]
      translated_text = response_data['translatedText']

      @file_controller.new_file(@text, translated_text)
    else
      puts "Não foi possível fazer sua tradução"
    end 
  end

  def init
    make_questions
    translate
  end
end

game = TranslateApp.new()
game.init
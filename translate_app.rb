class TranslateApp
  def make_questions
    puts "Selecione as opções:"
    print "Escolha o texto para ser traduzido: "

    @text = gets.chomp

    print "Escolha o idioma"

    @language = gets.chomp
  end
end
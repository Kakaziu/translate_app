class File_controller
  def new_file(word, translate)
    time = Time.new
    date = time.strftime('%d-%m-%y')
    hour = "#{time.hour}:#{time.min}"

    File.open("#{date}_#{hour}.txt", 'w') do |line|
      line.puts("Translation:")
      line.puts("Word: #{word}")
      line.puts("Translate: #{translate}")
    end
  end
end
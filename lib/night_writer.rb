require_relative 'language_translator'

class NightWriter < LanguageTranslator 
  
  def message_read_write
    english_text = File.read(@read_file)
    
    puts "Created #{@write_file} containing #{english_text.split('').count} characters" 

    translated_text = translates_english_to_braille(english_text)

    File.write(@write_file, translated_text) 
  end  
end
# night_writer = NightWriter.new
# night_writer.message_read_write
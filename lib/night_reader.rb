require_relative 'language_translator'

class NightReader < LanguageTranslator

  def message_read_write
    braille_text = File.read(@read_file)
    
    puts "Created #{@write_file} containing #{braille_text.split('').count} characters" 

    translated_text = translates_braille_to_english(braille_text)
    
    File.write(@write_file, translated_text) 
  end  
end
night_reader = NightReader.new
night_reader.message_read_write
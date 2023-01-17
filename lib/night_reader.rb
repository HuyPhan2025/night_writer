require_relative 'language_translator'

class NightReader < LanguageTranslator
  # attr_accessor :read_file,
  #               :write_file,
  #               :braille_alphabets

  # def initialize
  #   @read_file = ARGV[0]
  #   @write_file = ARGV[1]
  #   @braille_alphabets = {
  #     "a" => ["0.", "..", ".."],
  #     "b" => ["00", "..", ".."],
  #     "c" => ["0.", ".0", ".."],
  #     "d" => ["0.", ".0", "0."],
  #     "e" => ["0.", "..", "0."],
  #     "f" => ["00", ".0", ".."],
  #     "g" => ["00", ".0", "0."],
  #     "h" => ["00", "..", "0."],
  #     "i" => [".0", ".0", ".."],
  #     "j" => [".0", ".0", "0."],
  #     "k" => ["0.", "0.", ".."],
  #     "l" => ["00", "0.", ".."],
  #     "m" => ["0.", "00", ".."],
  #     "n" => ["0.", "00", "0."],
  #     "o" => ["0.", "0.", "0."],
  #     "p" => ["00", "00", ".."],
  #     "q" => ["00", "00", "0."],
  #     "r" => ["00", "0.", "0."],
  #     "s" => [".0", "00", ".."],
  #     "t" => [".0", "00", "0."],
  #     "u" => ["0.", "0.", ".0"],
  #     "v" => ["00", "0.", ".0"],
  #     "w" => [".0", ".0", "00"],
  #     "x" => ["0.", "00", ".0"],
  #     "y" => ["0.", "00", "00"],
  #     "z" => ["0.", "0.", "00"],
  #     " " => ["..", "..", ".."]
  #   }
  # end

  def message_read_write
    braille_text = File.read(@read_file)
    
    puts "Created #{@write_file} containing #{braille_text.split('').count} characters" 

    translated_text = translates_braille_to_english(braille_text)
    
    File.write(@write_file, translated_text) 
  end  
  
  def translates_braille_to_english(braille_text)
    array_text = braille_text.split("\n")
    
    compact_array_texts = array_text.delete_if { |string| string == "" }
    
    alphabet_texts = compact_array_texts.each_slice(3).map do |compact_array_text|
      compact_array_text.map do |string|
        string.scan(/../)
      end
    end
    # require'pry';binding.pry

    braille_arrays = alphabet_texts.flat_map do |alphabet_text|
      alphabet_text.transpose 
    end

    letters = braille_arrays.map do |array|
      @braille_alphabets.key(array)
    end.join
    
    forty_rule = letters.chars.each_slice(40).map do |letter|
      letter.join     
    end.join("\n")
  end
end

# night_reader = NightReader.new
# night_reader.message_read_write
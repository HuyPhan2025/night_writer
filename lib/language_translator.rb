class LanguageTranslator
  attr_accessor :read_file, 
                :write_file, 
                :braille_alphabets
  
  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
    @braille_alphabets = {
      "a" => ["0.", "..", ".."],
      "b" => ["00", "..", ".."],
      "c" => ["0.", ".0", ".."],
      "d" => ["0.", ".0", "0."],
      "e" => ["0.", "..", "0."],
      "f" => ["00", ".0", ".."],
      "g" => ["00", ".0", "0."],
      "h" => ["00", "..", "0."],
      "i" => [".0", ".0", ".."],
      "j" => [".0", ".0", "0."],
      "k" => ["0.", "0.", ".."],
      "l" => ["00", "0.", ".."],
      "m" => ["0.", "00", ".."],
      "n" => ["0.", "00", "0."],
      "o" => ["0.", "0.", "0."],
      "p" => ["00", "00", ".."],
      "q" => ["00", "00", "0."],
      "r" => ["00", "0.", "0."],
      "s" => [".0", "00", ".."],
      "t" => [".0", "00", "0."],
      "u" => ["0.", "0.", ".0"],
      "v" => ["00", "0.", ".0"],
      "w" => [".0", ".0", "00"],
      "x" => ["0.", "00", ".0"],
      "y" => ["0.", "00", "00"],
      "z" => ["0.", "0.", "00"],
      " " => ["..", "..", ".."]
    }
  end

  def translates_english_to_braille(english_text)
    message = letter_to_braille(english_text)

    join_braille_arrays(message)
  end 

  def letter_to_braille(english_text)
    array_text = english_text.split('')
    message = array_text.map do |letter|
      @braille_alphabets[letter]
    end   
  end

  def join_braille_arrays(arrays)
    apply_to_rule = arrays.each_slice(40).map do |letter_40|
      letter_40.transpose.filter_map do |letter|
        letter.join
      end.join("\n")
    end   
    apply_to_rule.join("\n\n")
  end

  def translates_braille_to_english(braille_text)
    # array_text = braille_text.split("\n")
    
    # compact_array_texts = array_text.delete_if { |string| string == "" }
    
    # nested_array_braille = compact_array_texts.each_slice(3).map do |compact_array_text|
    #   compact_array_text.map do |string|
    #     string.scan(/../)
    #   end
    # end
    nested_array_braille = braille_nested_array(braille_text)

    braille_arrays = nested_array_braille.flat_map do |alphabet_text|
      alphabet_text.transpose 
    end

    letters = braille_arrays.map do |array|
      @braille_alphabets.key(array)
    end.join
    
    forty_rule = letters.chars.each_slice(40).map do |letter|
      letter.join     
    end.join("\n")
  end

  def braille_nested_array(braille_text)
    array_text = braille_text.split("\n")
    
    compact_array_texts = array_text.delete_if { |string| string == "" }
    
    nested_array_braille = compact_array_texts.each_slice(3).map do |compact_array_text|
      compact_array_text.map do |string|
        string.scan(/../)
      end
    end
  end

  # require'pry';binding.pry
end
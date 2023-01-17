require_relative 'spec_helper'

RSpec.describe LanguageTranslator do
  let(:language_translator) {LanguageTranslator.new}

  describe '#initialize' do
    it "exists" do
      expect(language_translator).to be_instance_of(LanguageTranslator)
    end

    it "has attributes" do
      expected = {
      "a" => ["0.", "..", ".."],
      "b" => ["00", "..", ".."],
      "c" => ["0.", ".0", ".."],
      "d" => ["0.", ".0", "0."],
      "e" => ["0.", "..", "0."],
      "f" => ["00", ".0", ".."],
      "g" => ["00", ".0", "0."],
      "h" => ["0.", "00", ".."],
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
      expect(language_translator.braille_alphabets).to eq(expected)
    end
  end

  describe "#translate english to braille" do
    it 'returns translated braille' do
      expect(language_translator.translates_english_to_braille('z')).to eq("0.\n0.\n00")
      expect(language_translator.translates_english_to_braille('aaa')).to eq("0.0.0.\n......\n......")
      expect(language_translator.translates_english_to_braille('the')).to eq(".00.0.\n0000..\n0...0.")
    end

    it 'returns braille from english text' do 
      expect(language_translator.letter_to_braille("z")).to eq([["0.", "0.", "00"]])
      expect(language_translator.letter_to_braille("abc")).to eq([["0.", "..", ".."], ["00", "..", ".."], ["0.", ".0", ".."]])
    end

    it 'returns join braille arrays and transpose' do
      arrays = [["0.", "..", ".."], ["00", "..", ".."], ["0.", ".0", ".."]]

      expect(language_translator.join_braille_arrays(arrays)).to eq("0.000.\n.....0\n......")
    end
  end

  describe '#translate braille to english' do
    it 'returns braille from english' do
      expect(language_translator.translates_braille_to_english("0.\n0.\n00")).to eq("z")
      expect(language_translator.translates_braille_to_english("0.0.0.\n......\n......")).to eq("aaa")
      expect(language_translator.translates_braille_to_english(".00.0.\n0000..\n0...0.")).to eq("the")
    end

    it 'returns nested array from braille text' do
      expect(language_translator.braille_nested_array("0.\n0.\n00")).to eq([[["0."], ["0."], ["00"]]])
    end

    it 'returns join braille into array' do
      expect(language_translator.join_braille_text([[["0."], ["0."], ["00"]]])).to eq([["0.", "0.", "00"]])
    end

    it 'returns the letter from braille text' do
      expect(language_translator.letter_from_braille([["0.", "0.", "00"]])).to eq("z")
    end
  end
end
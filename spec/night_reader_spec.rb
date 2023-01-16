require_relative 'spec_helper'

RSpec.describe NightReader do
  let(:night_reader) {NightReader.new}

  before do
    night_reader.read_file = './braille_text.txt'
    night_reader.write_file = './english_text.txt'
  end

  it 'exists' do
    expect(night_reader).to be_a(NightReader)
  end

  it 'has attributes' do
    night_reader.message_read_write
  
    expect(night_reader.read_file).to eq('./braille_text.txt')
    expect(night_reader.write_file).to eq('./english_text.txt')
  end

  # it 'has a braille to alphabet dictionary' do
  #   expected = {
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
  #     }
  #   expect(night_reader.braille_alphabets).to eq(expected)
  # end

  # it 'translates braille text into english' do
  #   expect(night_reader.translates_braille_to_english("0.\n0.\n00")).to eq("z")
  #   expect(night_reader.translates_braille_to_english("0.0.0.\n......\n......")).to eq("aaa")
  #   expect(night_reader.translates_braille_to_english(".0000.\n00....\n0.0.0.")).to eq("the")
  # end


end
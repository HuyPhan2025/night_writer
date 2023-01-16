require_relative 'spec_helper'

RSpec.describe NightWriter do
  let(:night_writer) {NightWriter.new}
  
  before do
    night_writer.read_file = './english_text.txt'
    night_writer.write_file = './braille_text.txt'
  end
  
  it 'exists' do
    expect(night_writer).to be_a(NightWriter)
  end

  it 'has attributes' do
    night_writer.message_read_write

    expect(night_writer.read_file).to eq('./english_text.txt')
    expect(night_writer.write_file).to eq('./braille_text.txt')
  end

  it 'has alphabet to braille dictionary' do
    expected = {
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

    expect(night_writer.braille_alphabets).to eq(expected)
  end
  
  it 'translates english text into braille' do
    expect(night_writer.translates_english_to_braille('z')).to eq("0.\n0.\n00")
    expect(night_writer.translates_english_to_braille('aaa')).to eq("0.0.0.\n......\n......")
    expect(night_writer.translates_english_to_braille('the')).to eq(".0000.\n00....\n0.0.0.")
  end
end
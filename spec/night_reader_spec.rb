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
end
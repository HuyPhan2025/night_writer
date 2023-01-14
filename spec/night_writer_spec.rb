require './lib/night_writer'

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
    night_writer.call
    expect(night_writer.read_file).to eq('./english_text.txt')
    expect(night_writer.write_file).to eq('./braille_text.txt')
  end
end
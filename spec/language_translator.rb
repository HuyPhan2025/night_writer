require_relative 'spec_helper'

RSpec.describe LanguageTranslator do
  let(:language_translator) {LanguageTranslator.new}

  before do
    night_writer.read_file = './english_text.txt'
    night_writer.write_file = './braille_text.txt'
    night_reader.read_file = './braille_text.txt'
    night_reader.write_file = './english_text.txt'
  end

  describe '#initialize' do
    it "exists" do
      expect(language_translator).to be_instance_of(LanguageTranslator)
    end
  end
end
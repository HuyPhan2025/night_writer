require_relative 'spec_helper'

RSpec.describe LanguageTranslator do
  let(:language_translator) {LanguageTranslator.new}

  describe '#initialize' do
    it "exists" do
      expect(language_translator).to be_instance_of(LanguageTranslator)
    end
  end
end
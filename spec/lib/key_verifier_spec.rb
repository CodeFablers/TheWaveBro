require 'app_helper'

describe KeyVerifier do
  subject(:key_verifier) { KeyVerifier.new(test_key) }

  describe '#valid?' do
    context 'when api key is valid' do
      let(:test_key) { 'faI3elYy/xAE90qnlS489Q==' }

      it 'returns true' do
        expect(key_verifier.valid?).to eq(true)
      end
    end

    context 'when api key is invalid' do
      let(:test_key) { 'GaI3elFF/xAE90qnlS489O=!' }

      it 'returns true' do
        expect(key_verifier.valid?).to eq(false)
      end
    end
  end
end

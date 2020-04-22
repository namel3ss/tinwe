# frozen_string_literal: true

RSpec.describe Tinwe::Command do
  subject { described_class.new([]) }

  context 'class' do
    it 'has a read-only parser attribute' do
      expect(described_class.methods).to include(:parser_klass)
      expect(described_class.methods).not_to include(:parser_klass=)
    end

    describe '.parser' do
      it 'sets the parser_klass' do
        described_class.parser(Tinwe::Parser)
        expect(described_class.parser_klass).to eq(Tinwe::Parser)
      end
    end
  end

  it 'has read-only parser attribute' do
    expect(subject.methods).to include(:parser)
    expect(subject.methods).not_to include(:parser=)
  end

  describe '.new' do
    before do
      described_class.parser(parser_klass)
    end

    context 'with no parser specified' do
      let(:parser_klass) { nil }

      it 'does not set the parser' do
        expect(subject.parser).to be_nil
      end
    end

    context 'with a parser specified' do
      let(:parser_klass) { Tinwe::Parser }

      it 'sets the parser' do
        expect(subject.parser).not_to be_nil
        expect(subject.parser).to be_kind_of(parser_klass)
      end
    end
  end

  describe '.execute' do
    it 'raises not implemented error' do
      expect { subject.execute }.to raise_error('Not implemented yet.')
    end
  end
end

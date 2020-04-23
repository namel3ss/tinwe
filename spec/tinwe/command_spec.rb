# frozen_string_literal: true

RSpec.describe Tinwe::Command do
  subject { described_class.new([]) }

  context 'class' do
    describe 'parser_klass' do
      it 'is a read-only attribute' do
        expect(described_class.methods).to include(:parser_klass)
        expect(described_class.methods).not_to include(:parser_klass=)
      end
    end

    describe '.parser' do
      it 'sets the parser_klass' do
        described_class.parser(Tinwe::Parser)
        expect(described_class.parser_klass).to eq(Tinwe::Parser)
      end
    end

    describe 'command_key' do
      it 'is a read-only attribute' do
        expect(described_class.methods).to include(:command_key)
        expect(described_class.methods).not_to include(:command_key=)
      end
    end

    describe '.key' do
      it 'sets the command_key' do
        described_class.key('test')
        expect(described_class.command_key).to eq('test')
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

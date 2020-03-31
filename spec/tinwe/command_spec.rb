# frozen_string_literal: true

RSpec.describe Tinwe::Command do
  subject { described_class.new([]) }

  it 'has read-only parser attribute' do
    expect(subject.methods).to include(:parser)
    expect(subject.methods).not_to include(:parser=)
  end

  describe '.new' do
    it 'sets the parser' do
      expect(subject.parser).not_to be_nil
      expect(subject.parser).to be_kind_of(Tinwe::Parser)
    end
  end

  describe '.execute' do
    it 'raises not implemented error' do
      expect { subject.execute }.to raise_error('Not implemented yet.')
    end
  end
end

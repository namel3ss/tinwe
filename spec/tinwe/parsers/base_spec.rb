# frozen_string_literal: true

RSpec.describe Tinwe::Parsers::Base do
  subject { described_class.new(args) }

  let(:args) { [] }
  let(:usage) do
    <<~MSG
      tinwe
    MSG
  end

  it 'has read-only parser attribute' do
    expect(described_class.instance_methods).to include(:parser)
    expect(described_class.instance_methods).not_to include(:parser=)
  end

  it 'has read-only command attribute' do
    expect(described_class.instance_methods).to include(:command)
    expect(described_class.instance_methods).not_to include(:command=)
  end

  it 'has read-only options arguments' do
    expect(described_class.instance_methods).to include(:arguments)
    expect(described_class.instance_methods).not_to include(:arguments=)
  end

  describe 'parser' do
    it { expect(subject.parser.to_s).to eq(usage) }
  end

  describe '.new' do
    it do
      expect(subject.command).to be_nil
      expect(subject.arguments).to be_empty
      expect(subject.parser).not_to be_nil
      expect(subject.parser).to be_kind_of(OptionParser)
    end
  end
end

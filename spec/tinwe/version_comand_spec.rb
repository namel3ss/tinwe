# frozen_string_literal: true

RSpec.describe Tinwe::VersionCommand do
  it { expect(described_class.parser_klass).to be_nil }
  it { expect(described_class).to be < Tinwe::Command }
  it { expect(described_class.command_key).to eq(:version) }

  describe '.execute' do
    it 'returns the app version' do
      expect(subject.execute).to eq(Tinwe::VERSION)
    end
  end
end

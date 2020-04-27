# frozen_string_literal: true

require 'irb'

RSpec.describe Tinwe::Commands::Shell do
  it { expect(described_class.parser_klass).to be_nil }
  it { expect(described_class).to be < Tinwe::Commands::Base }
  it { expect(described_class.command_key).to eq(:shell) }

  describe '.execute' do
    before do
      allow(IRB).to receive(:start)
    end

    it 'starts irb' do
      subject.execute
      expect(IRB).to have_received(:start)
    end
  end
end

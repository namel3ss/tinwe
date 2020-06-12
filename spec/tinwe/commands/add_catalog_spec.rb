# frozen_string_literal: true

RSpec.describe Tinwe::Commands::AddCatalog do
  subject { described_class.new(args) }

  let(:args) { %w[default path] }
  let(:dummy_config) { Tinwe::Config.new }

  it { expect(described_class.parser_klass).to be(Tinwe::Parsers::AddCatalog) }
  it { expect(described_class).to be < Tinwe::Commands::Base }
  it { expect(described_class.command_key).to eq(:add) }

  describe '.execute' do
    before do
      allow(Tinwe::Config).to receive(:new).and_return(dummy_config)
      allow(dummy_config).to receive(:add_catalog).and_return(true)
    end

    it 'adds a catalog to the config' do
      subject.execute
      expect(dummy_config).to have_received(:add_catalog).with(*args).once
    end
  end
end

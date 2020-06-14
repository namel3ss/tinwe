# frozen_string_literal: true

RSpec.describe Tinwe::Commands::DbBase do
  subject { described_class.new(args) }

  let(:args) { %w[stats dummy] }
  let(:dummy_config) { Tinwe::Config.new }
  let(:catalog) { { 'name' => 'dummy', 'path' => 'dummy_path' } }

  before do
    allow(ActiveRecord::Base).to receive(:establish_connection).and_return(true)
    allow(Tinwe::Config).to receive(:new).and_return(dummy_config)
    allow(dummy_config).to receive(:find_catalog).and_return(catalog)
    described_class.parser(Tinwe::Parsers::Base)
  end

  describe '#initialize' do
    it 'establishes connection' do
      subject

      expect(ActiveRecord::Base)
        .to have_received(:establish_connection).with(adapter: 'sqlite3', database: catalog['path']).once
    end
  end
end

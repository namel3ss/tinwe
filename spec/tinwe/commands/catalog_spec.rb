# frozen_string_literal: true

RSpec.describe Tinwe::Commands::Catalog do
  it 'is a Tinwe::CommandGroup' do
    expect(described_class).to be < Tinwe::Commands::Group
  end

  it 'has an add catalog command' do
    expect(described_class.instance_methods)
      .to include(Tinwe::Commands::AddCatalog.command_key)
  end

  it 'has a parser' do
    expect(described_class.parser_klass).to eq(Tinwe::Parsers::Catalog)
  end

  it 'has a key' do
    expect(described_class.command_key).to eq(:catalog)
  end
end

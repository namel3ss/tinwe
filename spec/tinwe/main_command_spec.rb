# frozen_string_literal: true

require 'irb'

RSpec.describe Tinwe::MainCommand do
  it 'is a Tinwe::CommandGroup' do
    expect(described_class).to be < Tinwe::CommandGroup
  end

  it 'has a version command' do
    expect(described_class.instance_methods)
      .to include(Tinwe::VersionCommand.command_key)
  end

  it 'has a shell command' do
    expect(described_class.instance_methods)
      .to include(Tinwe::ShellCommand.command_key)
  end

  it 'has a parser' do
    expect(described_class.parser_klass).to eq(Tinwe::Parser)
  end

  it 'has a key' do
    expect(described_class.command_key).to eq(:main)
  end
end

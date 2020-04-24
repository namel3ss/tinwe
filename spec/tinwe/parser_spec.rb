# frozen_string_literal: true

RSpec.describe Tinwe::Parser do
  subject { described_class.new(args) }

  let(:args) { [] }
  let(:usage) do
    <<~MSG
      tinwe [options] command [command arguments]
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
    context 'with no args' do
      it do
        expect(subject.command).to be_nil
        expect(subject.arguments).to be_empty
        expect(subject.parser).not_to be_nil
        expect(subject.parser).to be_kind_of(OptionParser)
      end
    end

    context 'with any command' do
      let(:command) { 'some_command' }
      let(:args) { [command] }

      it do
        expect(subject.command).to eq(command)
        expect(subject.arguments).to be_empty
        expect(subject.parser).not_to be_nil
        expect(subject.parser).to be_kind_of(OptionParser)
      end
    end

    context 'with chain of commands' do
      let(:command) { 'some_command' }
      let(:subcommand) { 'other_command' }
      let(:args) { [command, subcommand] }

      it do
        expect(subject.command).to eq(command)
        expect(subject.arguments.size).to eq(1)
        expect(subject.arguments.first).to eq(subcommand)
      end
    end
  end
end

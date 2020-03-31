# frozen_string_literal: true

RSpec.describe Tinwe::Parser do
  subject { described_class.new(args) }

  let(:args) { [] }
  let(:usage) do
    <<~MSG
      tinwe [options] command [command arguments]

      Options for tinwe:

          -v, --version                    Display version
    MSG
  end

  it 'has read-only parser attribute' do
    expect(subject.methods).to include(:parser)
    expect(subject.methods).not_to include(:parser=)
  end

  it 'has read-only command attribute' do
    expect(subject.methods).to include(:command)
    expect(subject.methods).not_to include(:command=)
  end

  it 'has read-only options attribute' do
    expect(subject.methods).to include(:options)
    expect(subject.methods).not_to include(:options=)
  end

  it 'has read-only options arguments' do
    expect(subject.methods).to include(:arguments)
    expect(subject.methods).not_to include(:arguments=)
  end

  describe 'parser' do
    it { expect(subject.parser.to_s).to eq(usage) }
  end

  describe '.new' do
    context 'with no args' do
      it do
        expect(subject.command).to be_nil
        expect(subject.options).to be_empty
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
        expect(subject.options).to be_empty
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

    context 'with version option' do
      context 'with -v' do
        let(:args) { ['-v'] }

        it 'sets the command to version' do
          expect(subject.command).to eq('version')
          expect(subject.options).to be_empty
        end
      end

      context 'with --version' do
        let(:args) { ['--version'] }

        it 'sets the command to version' do
          expect(subject.command).to eq('version')
          expect(subject.options).to be_empty
        end
      end
    end
  end
end

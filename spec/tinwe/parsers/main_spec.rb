# frozen_string_literal: true

RSpec.describe Tinwe::Parsers::Main do
  subject { described_class.new(args) }

  let(:args) { [] }
  let(:usage) do
    <<~MSG
      tinwe [options] command

      Available commands:

          shell                            start an interactive ruby shell
          catalog                          manage your catalogs

      Options for tinwe:

          -v, --version                    Display version
    MSG
  end

  it { expect(described_class).to be < Tinwe::Parsers::Group }

  describe 'parser' do
    it { expect(subject.parser.to_s).to eq(usage) }
  end

  describe '.new' do
    context 'with version option' do
      context 'with -v' do
        let(:args) { ['-v'] }

        it 'sets the command to version' do
          expect(subject.command).to eq('version')
        end
      end

      context 'with --version' do
        let(:args) { ['--version'] }

        it 'sets the command to version' do
          expect(subject.command).to eq('version')
        end
      end
    end
  end
end

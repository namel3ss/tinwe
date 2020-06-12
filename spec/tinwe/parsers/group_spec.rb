# frozen_string_literal: true

RSpec.describe Tinwe::Parsers::Group do
  subject { described_class.new(args) }

  let(:args) { [] }

  it { expect(described_class).to be < Tinwe::Parsers::Base }

  describe '.new' do
    context 'with any command' do
      let(:command) { 'some_command' }
      let(:args) { [command] }

      it 'sets the command' do
        expect(subject.command).to eq(command)
        expect(subject.arguments).to be_empty
      end
    end

    context 'with chain of commands' do
      let(:command) { 'some_command' }
      let(:subcommand) { 'other_command' }
      let(:args) { [command, subcommand] }

      it 'sets the command and the arguments' do
        expect(subject.command).to eq(command)
        expect(subject.arguments.size).to eq(1)
        expect(subject.arguments.first).to eq(subcommand)
      end
    end
  end
end

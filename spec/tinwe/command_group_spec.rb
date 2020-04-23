# frozen_string_literal: true

RSpec.describe Tinwe::CommandGroup do
  subject { described_class.new(args) }

  let(:args) { %w[command] }

  before do
    described_class.parser(Tinwe::Parser)
  end

  context 'class' do
    let(:command1) { Class.new(Tinwe::Command) { key :command1 } }
    let(:command2) { Class.new(Tinwe::Command) { key :command2 } }

    describe '.commands' do
      it 'defines method for each command' do
        described_class.commands(command1, command2)
        expect(described_class.instance_methods)
          .to include(command1.command_key)
        expect(described_class.instance_methods)
          .to include(command2.command_key)
      end
    end
  end

  describe '.execute' do
    let(:command) { Class.new(Tinwe::Command) { key :dummy_command } }

    before do
      described_class.commands(command)
      allow_any_instance_of(command).to receive(:execute).and_return(true)
    end

    context 'with existing command' do
      let(:args) { [command.command_key] }

      it 'executess the command' do
        expect(subject.execute).to eq(true)
      end
    end

    context 'with non-existant command' do
      let(:args) { %w[random_command] }

      it 'raises an exception' do
        expect { subject.execute }.to raise_error Tinwe::UnknownCommandError
      end
    end
  end
end

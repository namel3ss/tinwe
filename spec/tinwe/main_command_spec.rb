# frozen_string_literal: true

require 'irb'

RSpec.describe Tinwe::MainCommand do
  let(:subject) { described_class.new(args) }
  let(:args) { [] }

  it_behaves_like 'command'

  describe '.new' do
    context 'with main command only' do
      it 'shows usage' do
        expect { subject }
          .to raise_error(Tinwe::CommandError,
                          Tinwe::Parser.new(args).parser.to_s)
      end
    end
  end

  describe '.execute' do
    context 'stats command' do
      let(:args) { ['stats'] }
      let(:stats_command) { Tinwe::StatsCommand.new([]) }

      it 'executes the stats command' do
        allow(stats_command).to receive(:execute)
        allow(Tinwe::StatsCommand).to receive(:new) { stats_command }
        subject.execute

        expect(Tinwe::StatsCommand).to have_received(:new).with([]).once
        expect(stats_command).to have_received(:execute).once
      end
    end

    context 'version command' do
      let(:args) { ['-v'] }

      it 'returns the version' do
        expect(subject.execute).to eq(Tinwe::VERSION)
      end
    end

    context 'shell command' do
      let(:args) { ['shell'] }

      before do
        allow(IRB).to receive(:start)
      end

      it 'stats a shell' do
        subject.execute
        expect(IRB).to have_received(:start)
      end
    end
  end
end

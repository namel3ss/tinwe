# frozen_string_literal: true

require 'irb'

RSpec.describe Tinwe::MainCommand do
  let(:subject) { described_class.new(args) }
  let(:args) { [] }

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

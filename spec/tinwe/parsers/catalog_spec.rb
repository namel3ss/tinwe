# frozen_string_literal: true

RSpec.describe Tinwe::Parsers::Catalog do
  subject { described_class.new(args) }

  let(:args) { [] }
  let(:usage) do
    <<~MSG
      tinwe catalog command

      Available commands:

          add                              start an interactive ruby shell

    MSG
  end

  it { expect(described_class).to be < Tinwe::Parsers::Base }

  describe 'parser' do
    it { expect(subject.parser.to_s).to eq(usage) }
  end
end

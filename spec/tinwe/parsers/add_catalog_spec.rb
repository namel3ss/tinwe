# frozen_string_literal: true

RSpec.describe Tinwe::Parsers::AddCatalog do
  subject { described_class.new(args) }

  let(:args) { [] }
  let(:usage) do
    <<~MSG
      tinwe catalog add name path

      Arguments:

          name                             the name of the catalog (required)
          path                             the path to the catalog (required). ~ is accepted too.

    MSG
  end

  it { expect(described_class).to be < Tinwe::Parsers::Base }

  describe 'parser' do
    it { expect(subject.parser.to_s).to eq(usage) }
  end
end

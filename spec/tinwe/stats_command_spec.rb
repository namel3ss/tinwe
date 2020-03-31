# frozen_string_literal: true

RSpec.describe Tinwe::StatsCommand do
  subject { described_class.new(args) }

  let(:args) { [] }

  it_behaves_like 'command'
end

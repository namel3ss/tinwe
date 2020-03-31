# frozen_string_literal: true

RSpec.shared_examples 'command' do
  it 'is a Tinwe::Command' do
    expect(described_class).to be < Tinwe::Command
  end
end

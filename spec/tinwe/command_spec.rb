# frozen_string_literal: true

require 'tinwe/command'
require 'tinwe'

RSpec.describe Tinwe::Command do
  describe '.execute' do
    describe 'command --version' do
      it 'returns the version' do
        result = described_class.execute(%w[--version])

        expect(result).to eq(Tinwe::VERSION)
      end
    end
  end
end

# frozen_string_literal: true

module Tinwe
  module Parsers
    # Parser for group command
    class Group < Base
      def initialize(args)
        super

        @command ||= arguments.shift
      end
    end
  end
end

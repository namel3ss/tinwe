# frozen_string_literal: true

module Tinwe
  module Errors
    # Error class for signalizing that a command is unknown.
    class UnknownCommand < CommandError
      def initialize(message)
        super("unknown command\n\n#{message}")
      end
    end
  end
end

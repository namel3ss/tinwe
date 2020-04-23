# frozen_string_literal: true

module Tinwe
  # Error class for signalizing that a command is unknown.
  class UnknownCommandError < CommandError
    def initialize(message)
      super("unknown command\n\n#{message}")
    end
  end
end

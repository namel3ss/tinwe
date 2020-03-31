# frozen_string_literal: true

module Tinwe
  # The main command for the application. Acts as an entry point
  # and invokes other commands when needed.
  class MainCommand < Command
    def initialize(args)
      super

      raise Tinwe::CommandError, @parser.parser if main_command_only?
    end

    def execute
      unless respond_to?(parser.command, true)
        raise Tinwe::CommandError, "unknown command\n\n#{parser.parser}"
      end

      send(parser.command)
    end

    private

    def stats
      StatsCommand.new(parser.arguments).execute
    end

    def version
      Tinwe::VERSION
    end

    def shell
      require 'irb'
      IRB.start
    end

    def main_command_only?
      parser.command.nil? && parser.options.empty?
    end
  end
end

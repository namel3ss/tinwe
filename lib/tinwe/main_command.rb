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
      case parser.command
      when 'version'
        Tinwe::VERSION
      when 'shell'
        require 'irb'
        IRB.start
      else
        raise Tinwe::CommandError, "unknown command\n\n#{parser.parser}"
      end
    end

    private

    def main_command_only?
      parser.command.nil? && parser.options.empty?
    end
  end
end

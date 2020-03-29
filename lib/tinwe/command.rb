# frozen_string_literal: true

require 'sqlite3'

module Tinwe
  # The command line user interface. It opens the catalog and
  # displays statistical data based on the options proveded.
  class Command
    def initialize(args)
      @parser = Parser.new(args)

      raise Tinwe::CommandError, @parser.parser if main_command_only?
    end

    def execute
      case @parser.command
      when 'version'
        Tinwe::VERSION
      when 'shell'
        require 'irb'
        IRB.start
      else
        raise Tinwe::CommandError, "unknown command\n\n#{@parser.parser}"
      end
    end

    private

    def main_command_only?
      @parser.command.nil? && @parser.options.empty?
    end
  end
end

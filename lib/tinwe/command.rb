# frozen_string_literal: true

require 'sqlite3'

module Tinwe
  # The command line user interface. It opens the catalog and
  # displays statistical data based on the options proveded.
  class Command
    def self.execute(args)
      parser = Parser.new(args)

      case parser.command
      when '--version'
        Tinwe::VERSION
      else
        raise CommandError, "unknown command\n\n#{parser.parser}"
      end
    end
  end
end

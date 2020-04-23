# frozen_string_literal: true

module Tinwe
  # Base class fro command groups
  class CommandGroup < Command
    class << self
      def commands(*commands)
        commands.each do |command_klass|
          define_method command_klass.command_key do |args|
            command_klass.new(args).execute
          end
        end
      end
    end

    def initialize(args = [])
      super

      raise Tinwe::CommandError, parser.parser if missing_command?
    end

    def execute
      unless respond_to?(parser.command)
        raise Tinwe::UnknownCommandError, parser.parser
      end

      send(parser.command, parser.arguments)
    end

    private

    def missing_command?
      parser&.command.nil?
    end
  end
end

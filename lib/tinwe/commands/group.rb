# frozen_string_literal: true

module Tinwe
  module Commands
    # Base class for command groups
    class Group < Base
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

        raise Tinwe::Errors::CommandError, parser.parser if missing_command?
      end

      def execute
        unless respond_to?(parser.command)
          raise Tinwe::Errors::UnknownCommand, parser.parser
        end

        send(parser.command, parser.arguments)
      end

      private

      def missing_command?
        parser&.command.nil?
      end
    end
  end
end

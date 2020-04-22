# frozen_string_literal: true

module Tinwe
  # Abstract class defining common interface for other commands.
  class Command
    class << self
      attr_reader :parser_klass

      def parser(klass)
        @parser_klass = klass
      end
    end

    attr_reader :parser

    def initialize(args = [])
      @parser = self.class.parser_klass.new(args) if self.class.parser_klass
    end

    def execute
      raise 'Not implemented yet.'
    end
  end
end

# frozen_string_literal: true

require 'sqlite3'

module Tinwe
  # Abstract class defining common interface for other commands.
  class Command
    attr_reader :parser

    def initialize(args)
      # TODO: Every command should be responsible to define parser type.
      @parser = Parser.new(args)
    end

    def execute
      raise 'Not implemented yet.'
    end
  end
end

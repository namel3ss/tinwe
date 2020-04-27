# frozen_string_literal: true

module Tinwe
  module Commands
    # The main command for the application. Acts as an entry point
    # and invokes other commands when needed.
    class Main < Group
      commands Version, Shell
      parser Tinwe::Parsers::Main
      key :main
    end
  end
end

# frozen_string_literal:  true

module Tinwe
  module Commands
    # Command for getting catalog statistics
    class Stats < DbBase
      key :stats
      parser Tinwe::Parsers::Stats

      def execute
        ::Tinwe::Models::LibraryFile.count
      end
    end
  end
end

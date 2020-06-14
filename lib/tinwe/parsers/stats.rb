# frozen_string_literal:  true

module Tinwe
  module Parsers
    # Parser for the stats command
    class Stats < Base
      def banner
        'tinwe stats catalog'
      end
    end
  end
end

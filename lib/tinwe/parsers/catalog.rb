# frozen_string_literal: true

module Tinwe
  module Parsers
    # Parser for the catalog command
    class Catalog < Base
      def options(opts)
        opts.separator ''
        opts.separator 'Available commands:'
        opts.separator ''
        opts.separator '    add                              start an interactive ruby shell'
        opts.separator ''
      end

      def banner
        'tinwe catalog command'
      end
    end
  end
end

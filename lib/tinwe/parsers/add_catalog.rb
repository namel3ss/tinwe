# frozen_string_literal: true

module Tinwe
  module Parsers
    # Parser for the add catalog command
    class AddCatalog < Base
      def options(opts)
        opts.separator ''
        opts.separator 'Arguments:'
        opts.separator ''
        opts.separator '    name                             the name of the catalog (required)'
        opts.separator '    path                             the path to the catalog (required). ~ is accepted too.'
        opts.separator ''
      end

      def banner
        'tinwe catalog add name path'
      end
    end
  end
end

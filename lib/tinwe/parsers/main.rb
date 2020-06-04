# frozen_string_literal: true

module Tinwe
  module Parsers
    # Parser for the main command
    class Main < Base
      def options(opts) # rubocop:disable Metrics/MethodLength
        opts.separator ''
        opts.separator 'Available commands:'
        opts.separator ''
        opts.separator '    shell                            start an interactive ruby shell'
        opts.separator ''
        opts.separator 'Options for tinwe:'
        opts.separator ''

        opts.on(
          '--version',
          '-v',
          'Display version'
        ) { @command = 'version' }
      end

      def banner
        'tinwe [options] command'
      end
    end
  end
end

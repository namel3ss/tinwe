# frozen_string_literal: true

module Tinwe
  # Parser for the main command
  class MainCommandParser < Parser
    def options(opts) # rubocop:disable Metrics/MethodLength
      # rubocop:disable Layout/LineLength
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
      # rubocop:enable Layout/LineLength
    end
  end
end

# frozen_string_literal: true

require 'optparse'

module Tinwe
  # A class for parsing the options passed to the Tinwe command.
  class Parser
    attr_reader :parser, :command, :definition, :options

    def initialize(args)
      @options = {}
      @parser = OptionParser.new do |opts|
        opts.banner << ' command [command arguments]'

        tinwe_options(opts)
      end

      parser.parse!(args)
      @command ||= args.shift
    end

    private

    def tinwe_options(opts)
      opts.separator ''
      opts.separator 'Options for tinwe:'

      opts.on(
        '--version',
        '-v',
        'Display version'
      ) { @command = '--version' }
    end
  end
end

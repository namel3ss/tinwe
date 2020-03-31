# frozen_string_literal: true

require 'optparse'

module Tinwe
  # A class for parsing the options passed to the Tinwe command.
  class Parser
    attr_reader :parser, :command, :options, :arguments

    def initialize(args)
      @options = {}
      @parser = OptionParser.new do |opts|
        opts.banner = 'tinwe [options] command [command arguments]'

        tinwe_options(opts)
      end

      parser.parse!(args)

      @command ||= args.shift
      @arguments = args
    end

    private

    def tinwe_options(opts)
      opts.separator ''
      opts.separator 'Options for tinwe:'
      opts.separator ''

      opts.on(
        '--version',
        '-v',
        'Display version'
      ) { @command = 'version' }
    end
  end
end

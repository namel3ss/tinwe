# frozen_string_literal: true

require 'optparse'

module Tinwe
  # A class for parsing the options passed to the Tinwe command.
  class Parser
    attr_reader :parser, :command, :arguments

    def initialize(args)
      @parser = OptionParser.new do |opts|
        opts.banner = 'tinwe [options] command [command arguments]'

        options(opts)
      end

      parser.parse!(args)

      @command ||= args.shift
      @arguments = args
    end

    private

    def options(opts); end
  end
end

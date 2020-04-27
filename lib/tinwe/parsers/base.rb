# frozen_string_literal: true

require 'optparse'

module Tinwe
  module Parsers
    # A class for parsing the options passed to the Tinwe command.
    class Base
      attr_reader :parser, :command, :arguments

      def initialize(args)
        @parser = OptionParser.new do |opts|
          opts.banner = banner

          options(opts)
        end

        parser.parse!(args)

        @command ||= args.shift
        @arguments = args
      end

      private

      def banner
        'tinwe'
      end

      def options(opts); end
    end
  end
end

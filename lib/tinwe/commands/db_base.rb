# frozen_string_literal: true

module Tinwe
  module Commands
    # Base class for commands accessing catalogs
    class DbBase < Base
      def initialize(args = [])
        super
        establish_connection
      end

      private

      def catalog
        Tinwe.config.find_catalog(parser.arguments.first)
      end

      def establish_connection
        ActiveRecord::Base.establish_connection(
          adapter: 'sqlite3',
          database: catalog['path']
        )
      end
    end
  end
end

# frozen_string_literal: true

module Tinwe
  module Commands
    # Command for adding catalogs to the config
    class AddCatalog < Base
      key :add
      parser ::Tinwe::Parsers::AddCatalog

      def execute
        config = Config.new
        config.add_catalog(catalog_name, catalog_path)
      end

      private

      def catalog_name
        parser.arguments[0]
      end

      def catalog_path
        parser.arguments[1]
      end
    end
  end
end

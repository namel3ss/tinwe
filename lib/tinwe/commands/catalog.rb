# frozen_string_literal: true

module Tinwe
  module Commands
    # Command for managing catalogs
    class Catalog < Group
      key :catalog
      parser Tinwe::Parsers::Catalog
    end
  end
end

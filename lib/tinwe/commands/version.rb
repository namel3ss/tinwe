# frozen_string_literal: true

module Tinwe
  module Commands
    # Gives information about the version of the application.
    class Version < Base
      key :version

      def execute
        Tinwe::VERSION
      end
    end
  end
end

# frozen_string_literal: true

module Tinwe
  module Commands
    # A command for opening IRB
    class Shell < Base
      key :shell

      def execute
        require 'irb'
        ::IRB.start
      end
    end
  end
end

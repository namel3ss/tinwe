# frozen_string_literal: true

module Tinwe
  # A command for opening IRB
  class ShellCommand < Command
    key :shell

    def execute
      require 'irb'
      ::IRB.start
    end
  end
end

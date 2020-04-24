# frozen_string_literal: true

module Tinwe
  # The main command for the application. Acts as an entry point
  # and invokes other commands when needed.
  class MainCommand < CommandGroup
    commands VersionCommand, ShellCommand
    parser Parser
    key :main
  end
end

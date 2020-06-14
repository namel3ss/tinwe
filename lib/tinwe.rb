# frozen_string_literal: true

require 'active_record'
require 'zeitwerk'
loader = Zeitwerk::Loader.for_gem
loader.setup

# This can be used to see statistics about your Lightroom Catalog.
#
# For a list on how to configure and use this, see:
#
# * `tinwe --help`
module Tinwe
  VERSION = '0.0.1'
  HOME = 'https://github.com/namel3ss/tinwe'

  def self.config
    Config.new
  end
end

# frozen_string_literal: true

require 'fileutils'
require 'yaml'

module Tinwe
  # Provides read and write capabilities for the configuration of the app
  class Config
    def add_catalog(name, path)
      # TODO: Validations

      settings[:catalogs] ||= []

      catalogs = settings[:catalogs].reject { |c| c[:name] == name }
      catalogs << { name: name, path: path }
      settings[:catalogs] = catalogs

      save
    end

    def save
      init unless exists?

      File.open(config_path, 'w') { |f| f.write(settings.to_yaml) }
    end

    def settings
      @settings ||= if File.exist?(config)
                      YAML.safe_load(File.open(config).read, [Symbol])
                    else
                      {}
                    end
    end

    private

    def init
      FileUtils.mkdir_p(File.dirname(config_path))
    end

    def exists?
      File.exist?(config_path)
    end

    def config_path
      Dir.home + '.config/tinwe/config.yml'
    end
  end
end

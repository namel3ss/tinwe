# frozen_string_literal: true

require 'fileutils'
require 'yaml'

module Tinwe
  # Provides read and write capabilities for the configuration of the app
  class Config
    def add_catalog(name, path)
      path = File.expand_path(path)

      raise ::Tinwe::Errors::CatalogNotFound unless File.exist?(path)

      settings['catalogs'] ||= []

      catalogs = settings['catalogs'].reject { |c| c['name'] == name }
      catalogs << { 'name' => name, 'path' => path }
      settings['catalogs'] = catalogs

      save
    end

    def find_catalog(name)
      settings['catalogs'].select { |c| c['name'] == name }.first
    end

    def save
      init unless exists?

      File.open(config_path, 'w') { |f| f.write(settings.to_yaml) }

      true
    end

    def settings
      @settings ||= if File.exist?(config_path)
                      YAML.safe_load(File.open(config_path).read)
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
      Dir.home + '/.config/tinwe/config.yml'
    end
  end
end

require 'yaml'
require_relative 'time_helper'

module Nippo
  class Configuration
    VALID_OPTIONS = %i[title root_dir].freeze
    attr_accessor *VALID_OPTIONS

    class << self
      def dir
        File.join(ENV['HOME'], '.nippo')
      end

      def file
        File.join(dir, 'config.yml')
      end
    end

    def initialize
      config = YAML.load_file(Configuration.file)
      VALID_OPTIONS.each do |key|
        send("#{key}=", config[key])
      end
    end

    def daily_dir
      File.join(self.root_dir, TimeHelper.formatted_month)
    end

    def daily_file
      File.join(daily_dir, 'daily.md')
    end
  end
end

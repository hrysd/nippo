require 'pathname'
require_relative 'time_helper'

module Nippo
  class Configuration
    VALID_OPTIONS = %i[title root_dir].freeze
    attr_accessor *VALID_OPTIONS

    class << self
      def dir
        Pathname.new(ENV['HOME']) + '.nippo'
      end

      def file
        dir + 'config.yml'
      end
    end

    def initialize
      config = YAML.load_file(Configuration.file)
      VALID_OPTIONS.each do |key|
        send("#{key}=", config[key])
      end
    end

    def daily_dir
      nippo_root_dir + TimeHelper.formatted_month
    end

    def daily_file
      daily_dir + 'daily.md'
    end

    def weekly_dir
      nippo_root_dir + TimeHelper.formatted_month + 'weekly.md'
    end

    private
      def nippo_root_dir
        Pathname.new(self.root_dir)
      end
  end
end

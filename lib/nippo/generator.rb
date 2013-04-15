require 'fileutils'
require 'yaml'
require_relative 'configuration'
require_relative 'time_helper'

module Nippo
  class Generator
    class << self
      def config
        @config ||= Configuration.new
      end

      def setup(title, current_dir)
        unless Configuration.file.exist?
          config_hash = {
            title: title,
            root_dir: current_dir
          }
          FileUtils.mkdir_p Configuration.dir
          touch_config
          generate_config_file(config_hash)
        end
      end

      def write_daily_nippo
        if config.daily_dir.exist?
          insert_daily_nippo
        else
          FileUtils.mkdir_p config.daily_dir
          touch_daily_nippo
          generate_daily_nippo
        end
      end

      def write_weekly_nippo
        "Not yet"
      end

      private
        def touch_config
          FileUtils.touch(Configuration.file)
        end

        def touch_daily_nippo
          FileUtils.touch(config.daily_file)
        end

        def generate_config_file(config_hash)
          open(Configuration.file, 'w') do |f|
            YAML.dump(config_hash, f)
          end
        end

        def generate_daily_nippo
          open(config.daily_file, 'w') do |f|
            f.puts "# #{config.title}"
            f.puts "\n"
            f.puts "## #{TimeHelper.formatted_date}"
          end
        end

        def insert_daily_nippo
          open(config.daily_file, 'a+') do |f|
            f.puts "\n"
            f.puts "## #{TimeHelper.formatted_date}"
            f.puts "\n"
          end
        end
    end
  end
end

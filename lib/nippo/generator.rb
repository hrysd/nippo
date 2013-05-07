require 'fileutils'
require 'yaml'
require_relative 'configuration'
require_relative 'time_helper'

module Nippo
  class Generator
    class << self
      def setup(title, current_dir)
        unless File.exist?(Configuration.file)
          config_hash = {
            title: title,
            root_dir: current_dir
          }
          FileUtils.mkdir_p Configuration.dir
          generate_config_file(config_hash)
        end
      end

      def write_daily_nippo(config)
        if File.exist?(config.daily_dir)
          insert_daily_nippo(config.daily_file)
        else
          FileUtils.mkdir_p config.daily_dir
          generate_daily_nippo(config.daily_file, config.title)
        end
      end

      private
        def generate_config_file(config_hash)
          open(Configuration.file, 'w') do |f|
            YAML.dump(config_hash, f)
          end
        end

        def generate_daily_nippo(daily_file, title)
          open(daily_file, 'w') do |f|
            f.puts "# #{config.title}"
            f.puts "\n"
            f.puts "## #{TimeHelper.formatted_date}"
          end
        end

        def insert_daily_nippo(daily_file)
          open(daily_file, 'a+') do |f|
            f.puts "\n"
            f.puts "## #{TimeHelper.formatted_date}"
            f.puts "\n"
          end
        end
    end
  end
end

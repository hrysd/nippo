require 'fileutils'
require 'yaml'
require_relative 'configuration'
require_relative 'time_helper'

module Nippo
  class Generator
    def self.config
      @config ||= Configuration.new
    end

    def self.setup(title, current_dir)
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

    def self.write_daily_nippo
      if config.daily_dir.exist?
        insert_daily_nippo
      else
        FileUtils.mkdir_p config.daily_dir
        touch_daily_nippo
        generate_daily_nippo
      end
    end

    def self.write_weekly_nippo
      "Not yet"
    end

    private
      def self.touch_config
        FileUtils.touch(Configuration.file)
      end

      def self.touch_daily_nippo
        FileUtils.touch(config.daily_file)
      end

      def self.generate_config_file(config_hash)
        open(Configuration.file, 'w') do |f|
          YAML.dump(config_hash, f)
        end
      end

      def self.generate_daily_nippo
        open(config.daily_file, 'w') do |f|
          f.puts "# #{config.title}"
          f.puts "\n"
          f.puts "## #{TimeHelper.formated_date}"
        end
      end

      def self.insert_daily_nippo
        open(config.daily_file, 'a+') do |f|
          f.puts "\n"
          f.puts "## #{TimeHelper.formated_date}"
          f.puts "\n"
        end
      end
  end
end
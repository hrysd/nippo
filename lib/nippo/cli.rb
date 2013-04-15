require 'thor'
require_relative 'generator'

module Nippo
  class Cli < Thor
    desc 'init [TITLE]', 'Initialize task.'
    def init(title)
      Nippo::Generator.setup(title, current_dir)
    end

    desc 'config', 'Edit config file'
    def config
      exec(editor, Configuration.config_file)
    end

    desc 'daily', 'Wirte daily Nippo.'
    def daily
      Nippo::Generator.write_daily_nippo
      exec(editor, Nippo::Generator.config.daily_file.to_s)
    end

    desc 'weekly', 'Write weekly Nippo.'
    def weekly
      Nippo::Generator.write_weekly_nippo
    end

    private
      def editor
        ENV['EDITOR'] or raise 'Could not find $EDITOR'
      end

      def current_dir
        Pathname.pwd
      end
  end
end

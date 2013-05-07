require 'thor'
require_relative 'generator'

module Nippo
  class Cli < Thor
    desc 'init [TITLE]', 'Initialize task.'
    def init(title)
      welcome
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

      def welcome
        puts <<-TEXT

    Let's


    b.             8  8 8888 8 888888888o   8 888888888o       ,o888888o.
    888o.          8  8 8888 8 8888    `88. 8 8888    `88.  . 8888     `88.
    Y88888o.       8  8 8888 8 8888     `88 8 8888     `88 ,8 8888       `8b
    .`Y888888o.    8  8 8888 8 8888     ,88 8 8888     ,88 88 8888        `8b
    8o. `Y888888o. 8  8 8888 8 8888.   ,88' 8 8888.   ,88' 88 8888         88
    8`Y8o. `Y88888o8  8 8888 8 888888888P'  8 888888888P'  88 8888         88
    8   `Y8o. `Y8888  8 8888 8 8888         8 8888         88 8888        ,8P
    8      `Y8o. `Y8  8 8888 8 8888         8 8888         `8 8888       ,8P
    8         `Y8o.`  8 8888 8 8888         8 8888          ` 8888     ,88'
    8            `Yo  8 8888 8 8888         8 8888             `8888888P'


        TEXT
      end

      def current_dir
        Pathname.pwd
      end
  end
end

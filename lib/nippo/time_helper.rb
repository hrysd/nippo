require 'active_support/time'

module Nippo
  module TimeHelper
    def self.now
      Time.now
    end

    def self.formatted_month
      now.strftime('%B').downcase
    end

    def self.formatted_date
      now.strftime('%Y-%m-%d')
    end
  end
end

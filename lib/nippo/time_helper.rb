require 'active_support/time'

module Nippo
  module TimeHelper
    def self.today
      Date.today
    end

    def self.formatted_month
      today.strftime("%B").downcase
    end

    def self.formatted_date
      today.strftime('%Y/%m/%d')
    end
  end
end

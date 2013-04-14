require 'active_support/time'

module Nippo
  module TimeHelper
    def self.today
      Date.today
    end

    def self.formated_month
      today.strftime("%B").downcase
    end

    def self.formated_date
      today.strftime
    end
  end
end

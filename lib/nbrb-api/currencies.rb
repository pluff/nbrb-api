module Nbrb
  module Api
    module Currencies
      def daily_rates(date = Date.today)
        response = call(:ex_rates_daily, message: {on_date: date.to_date})
        rates = response.find(*%w{Body ExRatesDailyResponse ExRatesDailyResult diffgram new_data_set daily_ex_rates_on_date})

        if rates.nil?
          raise Nbrb::Api::GeneralError, "No exchange rates found for operation #{:ex_rates_daily}"
        end

        result = {}
        [rates].flatten.each do |rate|
          result[rate[:cur_abbreviation]] = cleanup_rate_row(rate)
        end
        result
      end

      def cleanup_rate_row(row)
        row.each do |key, value|
          row.delete(key) if key.to_s[0] == '@'
        end
        row
      end
    end
  end
end

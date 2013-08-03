module Nbrb
  module Api
    module Currencies
      def daily_rates(date = Date.today)
        response = call(:ex_rates_daily, message: {on_date: date})
        rates = response.find(*%w{Body ExRatesDailyResponse ExRatesDailyResult diffgram new_data_set daily_ex_rates_on_date})

        if rates.nil?
          raise Nbrb::Api::GeneralError, "No exchange rates found for operation #{:ex_rates_daily}"
        end

        result = {}
        [rates].flatten.each do |rate|
          result[rate[:cur_abbreviation]] = rate[:cur_official_rate].to_f/rate[:cur_scale].to_i
        end
        result
      end
    end
  end
end

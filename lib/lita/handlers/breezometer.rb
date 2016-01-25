module Lita
  module Handlers
    class Breezometer < Handler

      config :api_key, type: String, required: true

      BaseUrl = 'http://api.breezometer.com/baqi/'

      Commands = [
        'breeze',
        'breezometer'
      ]

      Commands.each do |command|
        help_text = {
          "#{command} <location>" => 'Get the current air quality of a location.'
        }
        route(
          /#{Regexp.quote(command)}/i,
          :query,
          command: true,
          help: help_text
        )
      end

      def get_conditions(msg)
				location = URI::encode(msg.args.join(' '))
				# Whitelist only the fields we need to reduce the response size.
        fields = %w{
					breezometer_aqi
					breezometer_description
					breezometer_color
					country_aqi
				  country_color
					country_description
					country_name
					dominant_pollutant_text
				}.join(',')
        key = Lita.config.handlers.breezometer.api_key
        url = "http://api.breezometer.com/baqi/?location=#{location}&fields=#{fields}&key=#{key}"
        res = RestClient.get(url)
        begin
          body = MultiJson.load(res)
        rescue MultiJson::ParseError => e
          log.error(e)
          msg.reply 'I got back an invalid server response.'
          return
        end
        return body
      end

      def format_text(args, report)
				location = args.map(&:capitalize).join ' '
				aqi = report['breezometer_aqi'].to_s
				description = report['country_description'].to_s
				country = report['country_name'].to_s
				country_aqi = report['country_aqi'].to_s
				country_description = report['country_description'].to_s
				pollutant = report['dominant_pollutant_text']['main'].to_s
        return "*#{location}:* #{aqi}/#{description} (#{country} average: #{country_aqi}/#{country_description}) #{pollutant}"
      end

      def query(msg)
				if msg.args.length.zero?
					msg.reply 'Please provide a location.'
					return
				end
        report = get_conditions(msg)
        msg.reply format_text(msg.args, report)
      end

      Lita.register_handler(self)
    end
  end
end

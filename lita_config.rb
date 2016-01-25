Lita.configure do |config|
  ## Robot config
  config.robot.adapter = :shell
  config.robot.alias = '.'

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :debug

  ## Handlers
  #config.handlers.breezometer.api_key = 'INSERT TOKEN'

  config.http.host = '0.0.0.0'
  config.http.port = '8081'

end

Lita.configure do |config|
  # The name your robot will use.
  config.robot.name = "gina"

  config.http.port = ENV["PORT"]

  # The locale code for the language to use.
  # config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :info

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  config.robot.admins = ENV["GINA_ADMINS"].split(/,/)

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  config.robot.adapter = :slack
  config.adapters.slack.token = ENV["GINA_SLACK_TOKEN"]

  ## Example: Set options for the Redis connection.
  redis = CF::App::Credentials.find_all_by_all_service_tags(['redis', 'pivotal']).first
  config.redis["host"]     = redis.fetch('host')
  config.redis["port"]     = redis.fetch('port')
  config.redis["password"] = redis.fetch('password')

  config.handlers.giphy.api_key = "dc6zaTOxFJmzC" # Public beta key

  config.handlers.karma.cooldown = nil
end

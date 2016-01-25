require 'lita'
require 'open-uri'
require 'restclient'

Lita.load_locales Dir[File.expand_path(
  File.join("..", "..", "locales", "*.yml"), __FILE__
)]

require "lita/handlers/breezometer"

Lita::Handlers::Breezometer.template_root File.expand_path(
  File.join('..', '..', 'templates'),
 __FILE__
)

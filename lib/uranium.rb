require 'yaml'
require 'erb'
include ERB::Util

module Uranium
  require_relative 'uranium/core'
  require_relative 'uranium/parsers/parser_api_info'
  require_relative 'uranium/parsers/parser_api_paths'
  require_relative 'uranium/parsers/parser_api_path'
end
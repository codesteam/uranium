require 'yaml'
require 'erb'
include ERB::Util

module Uranium
  require 'uranium/core'
  require 'uranium/parsers/parser_api_info'
  require 'uranium/parsers/parser_api_paths'
  require 'uranium/parsers/parser_api_path'
end
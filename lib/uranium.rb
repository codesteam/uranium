require 'yaml'
require 'erb'
include ERB::Util

module Uranium
  require File.expand_path(File.dirname(__FILE__))+'/uranium/core'
  require File.expand_path(File.dirname(__FILE__))+'/uranium/parsers/parser_api_info'
  require File.expand_path(File.dirname(__FILE__))+'/uranium/parsers/parser_api_paths'
  require File.expand_path(File.dirname(__FILE__))+'/uranium/parsers/parser_api_path'
end
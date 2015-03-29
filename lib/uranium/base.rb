require 'yaml'
require 'erb'
require 'parsers/parser_api_info'
require 'parsers/parser_api_paths'
require 'parsers/parser_api_path'

module Uranium
  class Core
    def initialize(source, options = {})
      @options = {
        :view_layout   => File.expand_path(File.dirname(__FILE__))+'/templates/layout.html.erb',
        :view_api_path => File.expand_path(File.dirname(__FILE__))+'/templates/_api_path.html.erb',
      }
      @options = @options.merge(options)
      @source  = source
    end

    def decay
      @document       = YAML::parse(@source).root.to_ruby
      @document_info  = ParserApiInfo.new(@document)
      @document_paths = ParserApiPaths.new(@document)

      ERB.new(File.open(@options[:view_layout]){|file| file.read}).result(binding)
    end

    def render_api_method(method)
      ERB.new(File.open(@options[:view_api_path]){|file| file.read}).result(method.instance_eval { binding })
    end
  end
end
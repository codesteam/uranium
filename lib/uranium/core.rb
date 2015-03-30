module Uranium
  class Core
    def initialize(source, options = {})
      @options = {
        :view_layout    => File.expand_path(File.dirname(__FILE__))+'/templates/layout.html.erb',
        :view_api_path  => File.expand_path(File.dirname(__FILE__))+'/templates/_api_path.html.erb',
        :view_container => File.expand_path(File.dirname(__FILE__))+'/templates/_container.html.erb',
      }
      @options = @options.merge(options)
      @source  = source
    end

    def decay(use_layout = true)
      @document       = YAML::parse(@source).root.to_ruby
      @document_info  = Parsers::ApiInfo.new(@document)
      @document_paths = Parsers::ApiPaths.new(@document)

      return ERB.new(File.open(@options[:view_layout]){|file| file.read}).result(binding) if use_layout
      return render_container() if !use_layout
    end

    def render_api_method(method)
      ERB.new(File.open(@options[:view_api_path]){|file| file.read}).result(method.instance_eval { binding })
    end

    def render_container()
      ERB.new(File.open(@options[:view_container]){|file| file.read}).result(binding)
    end
  end
end
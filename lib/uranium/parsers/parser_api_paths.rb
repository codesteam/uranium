module Uranium
  module Parsers
    class ApiPaths
      attr_reader :paths, :tags

      def initialize(document)
        raise "Document's Path section not specified"  if document['paths'].nil?

        @paths = []
        definitions_parser = Parsers::ApiDefinitions.new(document['definitions'])
        document['paths'].each { |path| @paths << Parsers::ApiPath.new(path, definitions_parser) }
        
        @tags  = Set.new()
        @paths.each do |path|
          tags.merge(path.tags) unless path.tags.nil?
        end
      end
    end
  end
end
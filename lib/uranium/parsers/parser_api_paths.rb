module Uranium
  module Parsers
    class ApiPaths
      attr_reader :paths

      def initialize(document)
        raise "Document's Path section not specified"  if document['paths'].nil?

        @paths = []
        definitions_parser = Parsers::ApiDefinitions.new(document['definitions'])
        document['paths'].each { |path| @paths << Parsers::ApiPath.new(path, definitions_parser) }
      end
    end
  end
end
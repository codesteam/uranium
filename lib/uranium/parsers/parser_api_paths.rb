module Uranium
  module Parsers
    class ApiPaths
      attr_reader :paths

      def initialize(document)
        raise "Document's Path section not specified"  if document['paths'].nil?

        @paths = []
        document['paths'].each { |path| @paths << Parsers::ApiPath.new(path) }
      end
    end
  end
end
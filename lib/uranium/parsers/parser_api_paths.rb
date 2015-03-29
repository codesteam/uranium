module Uranium
  class ParserApiPaths
    attr_reader :paths

    def initialize(document)
      raise "Document's Path section not specified"  if document['paths'].nil?

      @paths = []
      document['paths'].each { |path| @paths << ParserApiPath.new(path) }
    end
  end
end
module Uranium
  module Parsers
    class ApiDefinitions
      attr_reader :definitions

      def initialize
        @scalar_types = ['integer', 'float', 'double', 'boolean', 'string']
      end

      def parse(type)
        raise "Type of parameter '#{type}' not supported" unless @scalar_types.include? type
      end
    end
  end
end
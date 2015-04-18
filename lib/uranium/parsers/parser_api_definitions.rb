module Uranium
  module Parsers
    class ApiDefinitions
      attr_reader :definitions

      def initialize(definitions)
        @scalar_types = ['integer', 'float', 'double', 'boolean', 'string']
        @definitions  = definitions
      end

      def parse(type)
        return type if @scalar_types.include? type
        return [parse(type.gsub("array_of_", "")), '...'] if type.include? "array_of_"

        raise "Unknown type #{type}" if @definitions[type].nil?
        raise "Type #{type} definition must contain array or object" unless @definitions[type].is_a?(Hash)

        result = {}
        @definitions[type].each do |sub_name, sub_type|
          result[sub_name] = parse(sub_type)
        end
        result
      end
    end
  end
end
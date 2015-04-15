module Uranium
  module Parsers
    class ApiDefinitions
      attr_reader :definitions

      def initialize(parameters)

        @supported_types = [
          "integer",
          "float",
          "double",
          "boolean",
          "char",
          "string"].to_set

        
        parameters.each_with_index do |parameter, index|
          checkout_parameter_type(parameter)
        end
      end

      def checkout_parameter_type(parameter)
        raise "Type of parameter '#{parameter['type']}' not supported"  unless @supported_types.include? parameter['type']
      end

    end
  end
end
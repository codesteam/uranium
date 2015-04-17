module Uranium
  module Parsers
    class ApiPath
      attr_reader :header, :querytype, :summary, :description, :parameters

      def initialize(path, definitions_parser)
        raise 'Path header section not specified'      if path[0].nil?
        raise 'Path information not specified'         if path[1].nil?
        raise 'Path query type section not specified'  if path[1]['query'].nil?
        raise 'Path summary section not specified'     if path[1]['summary'].nil?
        raise 'Path description section not specified' if path[1]['description'].nil?
        raise 'Query parameters not specified'         if path[1]['parameters'].nil?

        @header      = path[0]
        @querytype   = path[1]['query']
        @summary     = path[1]['summary']
        @description = path[1]['description']
        @parameters  = path[1]['parameters']
        @parameters.each_with_index do |parameter, index|
          raise 'Parameter description must be defined.'    if parameter['description'].nil?
          raise 'Parameter type must be defined'            if parameter['type'].nil?
          raise 'Parameter required option muse be defined' if parameter['required'].nil?
          raise 'Parameter name must be defined'            if parameter['name'].nil?

          definitions_parser.parse(parameter['type'])
        end
      end
    end
  end
end
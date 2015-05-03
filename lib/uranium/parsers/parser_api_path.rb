module Uranium
  module Parsers
    class ApiPath
      attr_reader :header, :querytype, :summary, :description, :parameters

      def initialize(path, definitions_parser)
        @querytype_values  = ['GET', 'POST', 'PUT', 'DELETE']
        @located_in_values = ['query', 'header', 'body']
        @response_codes    = (100...600).to_a << 'default'

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
        @responses   = path[1]['responses'].nil? ? [] : path[1]['responses']

        @parameters.each_with_index do |parameter, index|
          raise 'Parameter description must be defined.'    if parameter['description'].nil?
          raise 'Parameter type must be defined'            if parameter['type'].nil?
          raise 'Parameter required option muse be defined' if parameter['required'].nil?
          raise 'Parameter name must be defined'            if parameter['name'].nil?
          raise 'Parameter in must be defined'              if parameter['in'].nil?
          check_located_in parameter['in']

          parameter['type'] = definitions_parser.parse(parameter['type'])
          parameter['type'] = JSON.pretty_generate(parameter['type']) unless parameter['type'].is_a?(String)
        end

        @responses.each_with_index do |(code, response), index|
          raise "Response objects names can either be any valid HTTP status code or 'default'." unless @response_codes.include?(code)
          raise "Response '#{code}' section not specified"    if response.nil?
          raise 'Response description must be defined.'       if response['description'].nil?
        end

        check_querytype @querytype
      end

      def check_querytype(querytype)
        raise "Query type '#{querytype}' not supported" unless @querytype_values.include? querytype
      end

      def check_located_in(located_in)
        raise "Located in '#{located_in}' not supported" unless @located_in_values.include? located_in
      end
    end
  end
end
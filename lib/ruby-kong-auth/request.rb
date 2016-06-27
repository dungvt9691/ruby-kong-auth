require 'unirest'
module RubyKongAuth
  module Request
    class << self
      NET_READ_TIMEOUT = 5
      NET_OPEN_TIMEOUT = 5

      def get(path, params = nil, headers = {})
        endpoint = RubyKongAuth::Utils.endpoint_builder(path)
        Unirest.get(endpoint, :headers => headers, :parameters => params)
      end

      def post(path, params = nil, headers = {})
        endpoint = RubyKongAuth::Utils.endpoint_builder(path)
        Unirest.post(endpoint, :headers => headers, :parameters => params)
      end

      def put(path, params = nil, headers = {})
        endpoint = RubyKongAuth::Utils.endpoint_builder(path)
        Unirest.put(endpoint, :headers => headers, :parameters => params)
      end

      def patch(path, params = nil, headers = {})
        endpoint = RubyKongAuth::Utils.endpoint_builder(path)
        Unirest.patch(endpoint, :headers => headers, :parameters => params)
      end

      def delete(path, params = nil, headers = {})
        endpoint = RubyKongAuth::Utils.endpoint_builder(path)
        Unirest.delete(endpoint, :headers => headers, :parameters => params)
      end
    end
  end
end

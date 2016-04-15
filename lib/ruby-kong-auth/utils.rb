module RubyKongAuth
  module Utils
    class << self
      def endpoint_builder(path)
        RubyKongAuth.url + path
      end
    end
  end
end

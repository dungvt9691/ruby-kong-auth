require 'ruby-kong-auth/requests/consumer'

module RubyKongAuth
  class Consumer < Model
    attr_accessor :id, :custom_id, :username, :created_at
    
    class << self
      # Params: id
      #
      # Usage: RubyKongAuth::Consumer.find(id: 'xxx')
      def find(*args)
        request = RubyKongAuth::Request::Consumer.retrieve args[0]
        if request.code == 200
          Consumer.new(Consumer.symbolize_keys!(request.body))
        else
          nil
        end
      end
    end

    # Get consumer's keys auth
    # Usage: consumer  = RubyKongAuth::Consumer.find consumer_id: 'xxx'
    #        keys_auth = consumer.keys
    def keys
      RubyKongAuth::KeyAuth.all consumer_id: self.id
    end
  end
end

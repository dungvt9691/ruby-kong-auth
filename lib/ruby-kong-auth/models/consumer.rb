require 'ruby-kong-auth/requests/consumer'

module RubyKongAuth
  class Consumer < Model
    attr_accessor :id, :custom_id, :username, :created_at, :errors
    
    class << self
      # Params: id or username
      #
      # Usage: RubyKongAuth::Consumer.find(id: 'xxx')
      # Or: RubyKongAuth::Consumer.find(username: 'xxx')
      def find(*args)
        request = RubyKongAuth::Request::Consumer.retrieve args[0]
        if request.code == 200
          Consumer.new(symbolize_keys!(request.body))
        else
          nil
        end
      end
    end

    # Usage: consumer = RubyKongAuth::Consumer.new(username: 'xxx').save
    def save
      requires :custom_id, :username

      request = RubyKongAuth::Request::Consumer.create self.instance_values

      if request.code == 201
        request.body.each do |key, value|
          send("#{key.to_s}=", value) rescue false
        end

        true
      elsif request.code == 409
        send("errors=", request.body.values)
        false
      else
        send("errors=", [request.body['message']])
        false
      end
    end

    # Destroy consumer
    # Required params: username
    # Usage: consumer = RubyKongAuth::Consumer.find username: 'xxx'
    #        consumer.destroy
    def destroy(*args)
      request = RubyKongAuth::Request::Consumer.destroy username: self.username

      if request.code == 204
        true
      else
        self.errors = [request.body['message']]
        false
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

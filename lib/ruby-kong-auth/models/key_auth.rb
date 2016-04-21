require 'ruby-kong-auth/requests/key_auth'

module RubyKongAuth
  class KeyAuth < Model
    attr_accessor :id, :consumer_id, :key, :created_at, :errors
    
    class << self
      # Params: consumer_id
      #
      # Usage: RubyKongAuth::KeyAuth.all(consumer_id: 'xxx')
      def all(*args)
        request = RubyKongAuth::Request::KeyAuth.list args[0]
        if request.code == 200
          data = []
          request.body['data'].each do |key_auth|
            data << KeyAuth.new(KeyAuth.symbolize_keys!(key_auth))
          end

          data
        else
          []
        end
      end

      # Params: consumer_id, key_auth_id
      #
      # Usage: RubyKongAuth::KeyAuth.find consumer_id: 'xxx',
      #                                   id: 'xxx'
      def find(*args)
        request = RubyKongAuth::Request::KeyAuth.retrieve args[0]
        if request.code == 200
          KeyAuth.new(symbolize_keys!(request.body))
        else
          nil
        end
      end
    end

    # Get key auth consumer
    # Usage: key_auth = RubyKongAuth::KeyAuth.find consumer_id: 'xxx',
    #                                              id: 'xxx'
    #        consumer = key_auth.consumer
    def consumer
      RubyKongAuth::Consumer.find(consumer_id: self.consumer_id)
    end

    # Create key auth
    # Required params: consumer_id
    # Usage: key_auth = RubyKongAuth::KeyAuth.new consumer_id: 'xxx'
    #        key_auth.save
    def save(*args)
      requires :consumer_id

      request = RubyKongAuth::Request::KeyAuth.create consumer_id: self.consumer_id

      if request.code == 201
        request.body.each do |key, value|
          send("#{key.to_s}=", value) rescue false
        end

        true
      else
        send("errors=", [request.body['message']])
        false
      end
    end

    # Destroy key auth
    # Required params: consumer_id, :key_auth_id
    # Usage: key_auth RubyKongAuth::KeyAuth.find consumer_id: 'xxx',
    #                                            key_auth_id: 'xxx'                                                
    #        key_auth.destroy
    def destroy(*args)
      request = RubyKongAuth::Request::KeyAuth.destroy consumer_id: self.consumer_id,
                                                       id: self.id

      if request.code == 204
        true
      else
        self.errors = [request.body['message']]
        false
      end
    end

  end
end

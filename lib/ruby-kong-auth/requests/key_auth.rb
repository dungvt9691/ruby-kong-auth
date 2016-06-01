module RubyKongAuth
  module Request
    module KeyAuth
      class << self
        def list(*args)
          path = RubyKongAuth.paths[:key_auth][:list]
          path.gsub!(':consumer_id', args[0][:consumer_id])
          Request.get(path)
        end

        def retrieve(*args)
          path = RubyKongAuth.paths[:key_auth][:retrieve]
          path.gsub!(':consumer_id', args[0][:consumer_id])
          path.gsub!(':id', args[0][:id])
          Request.get(path)
        end

        def create(*args)
          path = RubyKongAuth.paths[:key_auth][:create]
          path.gsub!(':consumer_id', args[0][:consumer_id])
          Request.post(path, args[0])
        end

        def destroy(*args)
          path = RubyKongAuth.paths[:key_auth][:destroy]
          path.gsub!(':consumer_id', args[0][:consumer_id])
          path.gsub!(':id', args[0][:id])
          Request.delete(path, args[0])
        end
      end
    end # end of KeyAuth
  end # End of Request
end # End of RubyKongAuth

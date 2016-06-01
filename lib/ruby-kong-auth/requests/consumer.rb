module RubyKongAuth
  module Request
    module Consumer
      class << self
        def retrieve(*args)
          resource = args[0][:id] || args[0][:username]
          path = RubyKongAuth.paths[:consumer][:retrieve]
          path.gsub!(':id', resource)
          Request.get(path)
        end

        def create(*args)
          path = RubyKongAuth.paths[:consumer][:create]
          Request.post(path, args[0])
        end

        def destroy(*args)
          resource = args[0][:id] || args[0][:username]
          path = RubyKongAuth.paths[:consumer][:destroy]
          path.gsub!(':id', resource)
          Request.delete(path, args[0])
        end
      end
    end # end of Consumer
  end # End of Request
end # End of RubyKongAuth

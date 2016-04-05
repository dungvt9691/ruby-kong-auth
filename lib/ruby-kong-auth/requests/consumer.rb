module RubyKongAuth
  module Request
    module Consumer
      class << self

        def retrieve(*args)
          path = RubyKongAuth.paths[:consumer][:retrieve]
          path.gsub!(':id', args[0][:id])
          Request.get(path)
        end

      end

      class Stub
        def self.retrieve
          path = RubyKongAuth.paths[:consumer][:retrieve]
          path.gsub!(":id", "806a979f-75d5-49b3-9ef7-3869f8c3f882")
          url  = RubyKongAuth::Utils.endpoint_builder(path)

          request = RubyKongAuth::Stub.request(
            :method   => :get,
            :url      => url,
            :response => {
              :status => 200,
              :body   => {
                'username'   => 'dungvt9691',
                'created_at' => 1458789832000,
                'id'         => "806a979f-75d5-49b3-9ef7-3869f8c3f882"
                }.to_json
              }
              )
        end
      end
      
    end # end of Consumer
  end # End of Request
end # End of RubyKongAuth

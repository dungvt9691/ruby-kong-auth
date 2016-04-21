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

      end

      class Stub
        def self.retrieve
          path = RubyKongAuth.paths[:consumer][:retrieve]
          path.gsub!(":id", "test_consumer")
          url  = RubyKongAuth::Utils.endpoint_builder(path)

          request = RubyKongAuth::Stub.request(
            :method   => :get,
            :url      => url,
            :response => {
              :status => 200,
              :body   => {
                'username'   => 'test_consumer',
                'created_at' => 1458789832000,
                'id'         => "806a979f-75d5-49b3-9ef7-3869f8c3f882"
              }.to_json
            }
          )
        end

        def self.create
          path = RubyKongAuth.paths[:consumer][:create]
          url  = RubyKongAuth::Utils.endpoint_builder(path)

          RubyKongAuth::Stub.request(
            :method   => :post,
            :url      => url,
            :request  => {
              :body => {
                :custom_id => '08fcae40-e8ff-0133-faf6-245e60c56cb7',
                :username => 'test_consumer'
              }
            },
            :response => {
              :status => 201,
              :body   => {
                'custom_id'  => '08fcae40-e8ff-0133-faf6-245e60c56cb7',
                'username'   => 'test_consumer',
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

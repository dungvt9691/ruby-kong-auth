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

      class Stub
        def self.list
          path = RubyKongAuth.paths[:key_auth][:list]
          path.gsub!(":consumer_id", "806a979f-75d5-49b3-9ef7-3869f8c3f882")
          url  = RubyKongAuth::Utils.endpoint_builder(path)

          request = RubyKongAuth::Stub.request(
            :method   => :get,
            :url      => url,
            :response => {
              :status => 200,
              :body   => {
                "data" => [{
                    "consumer_id" => "806a979f-75d5-49b3-9ef7-3869f8c3f882",
                    "created_at" => 1459572799000,
                    "id" => "9f859d95-4db9-47e5-8ddd-a5eed3f5bd35",
                    "key" => "2536556395904d40bdc7ff7a8abb7674"
                  },
                  {
                    "consumer_id" => "806a979f-75d5-49b3-9ef7-3869f8c3f882",
                    "created_at" => 1459571582000,
                    "id" => "9f859d95-4db9-47e5-8ddd-a5eed3f5bd35",
                    "key" => "0c426c8c046d4f569c1d697858972cc8"
                  },
                  {
                    "consumer_id" => "806a979f-75d5-49b3-9ef7-3869f8c3f882",
                    "created_at" => 1459571509000,
                    "id" => "9f859d95-4db9-47e5-8ddd-a5eed3f5bd35",
                    "key" => "368dc176fe404629a35ebf2251fd5c73"
                  },
                ],
                "total" => 7
              }.to_json
            }
          )
        end

        def self.retrieve
          path = RubyKongAuth.paths[:key_auth][:retrieve]
          path.gsub!(":consumer_id", "806a979f-75d5-49b3-9ef7-3869f8c3f882")
          path.gsub!(":id", "9f859d95-4db9-47e5-8ddd-a5eed3f5bd35")
          url  = RubyKongAuth::Utils.endpoint_builder(path)

          request = RubyKongAuth::Stub.request(
            :method   => :get,
            :url      => url,
            :response => {
              :status => 200,
              :body   => {
                "consumer_id" => "806a979f-75d5-49b3-9ef7-3869f8c3f882",
                "created_at" => 1459572799000,
                "id" => "9f859d95-4db9-47e5-8ddd-a5eed3f5bd35",
                "key" => "2536556395904d40bdc7ff7a8abb7674"
              }.to_json
            }
          )
        end

        def self.create
          path = RubyKongAuth.paths[:key_auth][:create]
          path.gsub!(":consumer_id", "806a979f-75d5-49b3-9ef7-3869f8c3f882")
          url  = RubyKongAuth::Utils.endpoint_builder(path)

          request = RubyKongAuth::Stub.request(
            :method   => :post,
            :url      => url,
            :response => {
              :status => 201,
              :body   => {
                "consumer_id" => "806a979f-75d5-49b3-9ef7-3869f8c3f882",
                "created_at" => 1459572799000,
                "id" => "9f859d95-4db9-47e5-8ddd-a5eed3f5bd35",
                "key" => "2536556395904d40bdc7ff7a8abb7674"
              }.to_json
            }
          )
        end

        def self.destroy
          path = RubyKongAuth.paths[:key_auth][:destroy]
          path.gsub!(":consumer_id", "806a979f-75d5-49b3-9ef7-3869f8c3f882")
          path.gsub!(":id", "9f859d95-4db9-47e5-8ddd-a5eed3f5bd35")
          url  = RubyKongAuth::Utils.endpoint_builder(path)

          request = RubyKongAuth::Stub.request(
            :method   => :delete,
            :url      => url,
            :response => {
              :status => 204,
              :body   => "".to_json
            }
          )
        end
      end
      
    end # end of Keu Auth
  end # End of Request
end # End of RubyKongAuth

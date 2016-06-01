require 'spec_helper'

describe RubyKongAuth::KeyAuth do
  before(:each) do
    require 'webmock'
    include WebMock::API
    RubyKongAuth.new(RubyKongAuth.mockurl)
  end

  after(:each) do
    RubyKongAuth::Stub.reopen_real_connection!
  end

  it 'list all consumer key auth by consumer id (/consumers/:consumer_id/key-auth)' do
    # Mock with /consumers/806a979f-75d5-49b3-9ef7-3869f8c3f882/key-auth path
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

    object = RubyKongAuth::KeyAuth.all consumer_id: '806a979f-75d5-49b3-9ef7-3869f8c3f882'

    expect(object).not_to be_empty
  end

  it 'retrieve a key auth by id (/consumers/:consumer_id/key-auth/:id)' do
    # Mock with /consumers/806a979f-75d5-49b3-9ef7-3869f8c3f882/key-auth/:9f859d95-4db9-47e5-8ddd-a5eed3f5bd35 path
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

    object = RubyKongAuth::KeyAuth.find consumer_id: '806a979f-75d5-49b3-9ef7-3869f8c3f882',
                                        id: '9f859d95-4db9-47e5-8ddd-a5eed3f5bd35'

    expect(object).not_to be_nil
  end

  it 'create key auth (/consumers/:consumer_id/key-auth)' do
    # Mock with /consumers/806a979f-75d5-49b3-9ef7-3869f8c3f882/key-auth path
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

    object = RubyKongAuth::KeyAuth.new consumer_id: '806a979f-75d5-49b3-9ef7-3869f8c3f882'

    expect(object.save).to be true

  end

  it 'destroy key auth (/consumers/:consumer_id/key-auth/:id)' do
    # Mock with /consumers/806a979f-75d5-49b3-9ef7-3869f8c3f882/key-auth/:9f859d95-4db9-47e5-8ddd-a5eed3f5bd35 path
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

    # Mock with /consumers/806a979f-75d5-49b3-9ef7-3869f8c3f882/key-auth/:9f859d95-4db9-47e5-8ddd-a5eed3f5bd35 path
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

    object = RubyKongAuth::KeyAuth.find consumer_id: '806a979f-75d5-49b3-9ef7-3869f8c3f882',
                                        id: '9f859d95-4db9-47e5-8ddd-a5eed3f5bd35'

    expect(object.destroy).to be true

  end

end

require 'spec_helper'

describe RubyKongAuth::Consumer do
  before(:each) do
    require 'webmock'
    include WebMock::API
    RubyKongAuth.new(RubyKongAuth.mockurl)
  end

  after(:each) do
    RubyKongAuth::Stub.reopen_real_connection!
  end

  it 'retrieve a consumer by id (/consumers/:id)' do
    # Mock with /consumers/mailship_test path
    path = RubyKongAuth.paths[:consumer][:retrieve]
    path.gsub!(":id", "mailship_test")
    url  = RubyKongAuth::Utils.endpoint_builder(path)

    request = RubyKongAuth::Stub.request(
      :method   => :get,
      :url      => url,
      :response => {
        :status => 200,
        :body   => {
          'username'   => 'mailship_test',
          'created_at' => 1458789832000,
          'id'         => "806a979f-75d5-49b3-9ef7-3869f8c3f882"
        }.to_json
      }
    )

    object = RubyKongAuth::Consumer.find username: 'mailship_test'

    expect(object).not_to be_nil
  end

  it 'create a consumer (/consumers)' do
    # Mock with /consumers path
    path = RubyKongAuth.paths[:consumer][:create]
    url  = RubyKongAuth::Utils.endpoint_builder(path)

    RubyKongAuth::Stub.request(
      :method   => :post,
      :url      => url,
      :request  => {
        :body => {
          :custom_id => '08fcae40-e8ff-0133-faf6-245e60c56cb7',
          :username => 'mailship_test'
        }
      },
      :response => {
        :status => 201,
        :body   => {
          'custom_id'  => '08fcae40-e8ff-0133-faf6-245e60c56cb7',
          'username'   => 'mailship_test',
          'created_at' => 1458789832000,
          'id'         => "806a979f-75d5-49b3-9ef7-3869f8c3f882"
        }.to_json
      }
    )

    consumer_params = {
      custom_id: "08fcae40-e8ff-0133-faf6-245e60c56cb7",
      username: "mailship_test"
    }

    object = RubyKongAuth::Consumer.new consumer_params

    expect(object.save).to be true
  end

  it 'destroy consumer (/consumers/:id)' do
    # Mock with /consumers/mailship_test path
    path = RubyKongAuth.paths[:consumer][:retrieve]
    path.gsub!(":id", "mailship_test")
    url  = RubyKongAuth::Utils.endpoint_builder(path)

    request = RubyKongAuth::Stub.request(
      :method   => :get,
      :url      => url,
      :response => {
        :status => 200,
        :body   => {
          'username'   => 'mailship_test',
          'created_at' => 1458789832000,
          'id'         => "806a979f-75d5-49b3-9ef7-3869f8c3f882"
        }.to_json
      }
    )

    # Mock with /consumers/mailship_test path
    path = RubyKongAuth.paths[:consumer][:destroy]
    path.gsub!(":id", "mailship_test")
    url  = RubyKongAuth::Utils.endpoint_builder(path)

    request = RubyKongAuth::Stub.request(
      :method   => :delete,
      :url      => url,
      :response => {
        :status => 204,
        :body   => "".to_json
      }
    )

    object = RubyKongAuth::Consumer.find username: 'mailship_test'

    expect(object.destroy).to be true

  end

end

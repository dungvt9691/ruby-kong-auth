require 'spec_helper'

describe RubyKongAuth::Consumer do
  before(:all) do
    RubyKongAuth.new(RubyKongAuth.mockurl)
  end

  it 'retrieve a consumer by id (/consumers/:id)' do
    RubyKongAuth::Request::Consumer::Stub.retrieve

    object = RubyKongAuth::Consumer.find username: 'test_consumer'

    expect(object).not_to be_nil
  end

  it 'create a consumer (/consumers)' do
    RubyKongAuth::Request::Consumer::Stub.create

    consumer_params = {
      custom_id: "08fcae40-e8ff-0133-faf6-245e60c56cb7",
      username: "test_consumer"
    }

    object = RubyKongAuth::Consumer.new consumer_params

    expect(object.save).to be true
  end

end

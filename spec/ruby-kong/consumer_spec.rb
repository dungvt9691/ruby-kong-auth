require 'spec_helper'

describe RubyKongAuth::Consumer do
  before(:all) do
    RubyKongAuth.new(RubyKongAuth.mockurl)
  end

  it 'retrieve a consumer by id (/consumers/:id)' do
    RubyKongAuth::Request::Consumer::Stub.retrieve

    object = RubyKongAuth::Consumer.find id: '806a979f-75d5-49b3-9ef7-3869f8c3f882'

    expect(object).not_to be_nil
  end

end

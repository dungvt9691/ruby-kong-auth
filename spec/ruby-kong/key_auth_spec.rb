require 'spec_helper'

describe RubyKongAuth::KeyAuth do
  before(:all) do
    RubyKongAuth.new(RubyKongAuth.mockurl)
  end

  it 'list all consumer key auth by consumer id (/consumers/:consumer_id/key-auth)' do
    RubyKongAuth::Request::KeyAuth::Stub.list

    object = RubyKongAuth::KeyAuth.all consumer_id: '806a979f-75d5-49b3-9ef7-3869f8c3f882'

    expect(object).not_to be_empty
  end

  it 'retrieve a key auth by id (/consumers/:consumer_id/key-auth/:id)' do
    RubyKongAuth::Request::KeyAuth::Stub.retrieve

    object = RubyKongAuth::KeyAuth.find consumer_id: '806a979f-75d5-49b3-9ef7-3869f8c3f882',
                                        id: '9f859d95-4db9-47e5-8ddd-a5eed3f5bd35'

    expect(object).not_to be_nil
  end

  it 'create key auth (/consumers/:consumer_id/key-auth)' do
    RubyKongAuth::Request::KeyAuth::Stub.create

    object = RubyKongAuth::KeyAuth.new consumer_id: '806a979f-75d5-49b3-9ef7-3869f8c3f882'

    expect(object.save).to be true

  end

  it 'create key auth (/consumers/:consumer_id/key-auth)' do
    RubyKongAuth::Request::KeyAuth::Stub.retrieve
    RubyKongAuth::Request::KeyAuth::Stub.destroy

    object = RubyKongAuth::KeyAuth.find consumer_id: '806a979f-75d5-49b3-9ef7-3869f8c3f882',
                                        id: '9f859d95-4db9-47e5-8ddd-a5eed3f5bd35'

    expect(object.destroy).to be true

  end

end

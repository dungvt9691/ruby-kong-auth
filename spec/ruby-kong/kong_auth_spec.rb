require 'spec_helper'

describe RubyKongAuth do
  it 'has a version number' do
    expect(RubyKongAuth::VERSION).not_to be nil
  end

  it 'endpoint_builder work fine' do
    test_url = RubyKong.url + '/test'
    expect(RubyKongAuth::Utils.endpoint_builder('/test')).not_to be test_url
  end
end

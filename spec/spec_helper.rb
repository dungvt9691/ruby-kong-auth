require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'webmock/rspec'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ruby-kong-auth'
include WebMock::API

RubyKongAuth::Stub.reopen_real_connection!
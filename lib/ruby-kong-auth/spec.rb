module RubyKongAuth
  class << self
    attr_accessor :url

    def paths
      {
        :consumer     => {
          :retrieve => '/consumers/:id',
          :create   => '/consumers',
          :destroy  => '/consumers/:id'
        },
        :key_auth     => {
          :list     => '/consumers/:consumer_id/key-auth',
          :create   => '/consumers/:consumer_id/key-auth',
          :retrieve => '/consumers/:consumer_id/key-auth/:id',
          :destroy  => '/consumers/:consumer_id/key-auth/:id'
        }
      }
    end

    def mockurl
      @mockurl = 'http://mockdomain:8001'
    end
  end
end

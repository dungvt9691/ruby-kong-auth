module RubyKongAuth
  class << self
    def new(kong_url = 'http://123.31.11.81:8001')
      RubyKongAuth.url = kong_url
    end
  end
end

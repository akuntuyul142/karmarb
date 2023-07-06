module Karma
  class << self
    attr_accessor :configuration
  end

  class Configuration
    attr_accessor :port, :host

    def initialize
      @host = 'localhost'
      @port = 8080
    end
  end

  def self.configure
    yield(configuration)
  end

  def self.configuration
    @@configuration ||= Configuration.new
  end
end
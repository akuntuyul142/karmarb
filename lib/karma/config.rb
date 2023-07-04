module Karma
  Config = Struct.new(:host, :port) do
    def initialize
      self.port = 8080
      self.host = 'localhost'
    end
  end

  def self.configure
    @config = Config.new
    yield(@config) if block_given?
    @config
  end

  def self.config
    @config || configure
  end
end
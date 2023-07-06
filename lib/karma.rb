require 'json'
require 'socket'

require 'karma/version'
require 'karma/config'
require 'karma/connection'
require 'karma/tree'

module Karma
  TREE = Tree.new

  def self.method_missing(m, *args, &block)
    TREE.send(m, *args, &block)
  end
end

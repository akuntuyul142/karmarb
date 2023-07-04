module Karma
  class Tree
    def initialize
      @connection = Connection.new
      @tree_name  = nil
    end

    def tree(name)
      @tree_name = name
      self
    end

    def ping
      request = {
        command: 'ping'
      }
      @connection.send_and_read(request)
    end

    def trees
      request = {
        command: 'trees'
      }
      @connection.send_and_read(request)
    end

    def create(name)
      request = {
        command: 'create',
        tree_name: name
      }
      @connection.send_and_read(request)
    end

    def drop(name)
      request = {
        command: 'drop',
        tree_name: name
      }
      @connection.send_and_read(request)
    end

    def dump(name)
      request = {
        command: 'dump',
        tree_name: name
      }
      @connection.send_and_read(request)
    end

    def dump_all
      request = {
        command: 'dump_all'
      }
      @connection.send_and_read(request)
    end

    def dumps
      request = {
        command: 'dumps'
      }
      @connection.send_and_read(request)
    end

    def load(name)
      request = {
        command: 'load',
        tree_name: name
      }
      @connection.send_and_read(request)
    end

    def increment(**args)
      request = {
        command: 'increment',
        tree_name: @tree_name
      }.merge!(args)
      @connection.send_and_read(request)
    end

    def decrement(**args)
      request = {
        command: 'decrement',
        tree_name: @tree_name
      }.merge!(args)
      @connection.send_and_read(request)
    end

    def sum(**args)
      request = {
        command: 'sum',
        tree_name: @tree_name
      }.merge!(args)
      @connection.send_and_read(request)
    end

    def find(**args)
      request = {
        command: 'find',
        tree_name: @tree_name
      }.merge!(args)
      @connection.send_and_read(request)
    end

    def reset(**args)
      request = {
        command: 'reset',
        tree_name: @tree_name,
      }.merge!(args)
      @connection.send_and_read(request)
    end

    def delete(**args)
      request = {
        command: 'delete',
        tree_name: @tree_name,
      }.merge!(args)
      @connection.send_and_read(request)
    end
  end
end
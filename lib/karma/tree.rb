require 'connection_pool'

module Karma
  class Tree
    def initialize
      @connection = ConnectionPool.new(size: 5, timeout: 0.5) do
        Connection.new
      end
      @tree_name = nil
    end

    def tree(name)
      @tree_name = name
      self
    end

    def ping
      request = {
        command: 'ping'
      }

      @connection.with do |conn|
        conn.send_and_read(request)
      end
    end

    def trees
      request = {
        command: 'trees'
      }

      @connection.with do |conn|
        conn.send_and_read(request)
      end
    end

    def create(name)
      request = {
        command: 'create',
        tree_name: name
      }

      @connection.with do |conn|
        conn.send_and_read(request)
      end
    end

    def drop(name)
      request = {
        command: 'drop',
        tree_name: name
      }

      @connection.with do |conn|
        conn.send_and_read(request)
      end
    end

    def dump(name)
      request = {
        command: 'dump',
        tree_name: name
      }

      @connection.with do |conn|
        conn.send_and_read(request)
      end
    end

    def dump_all
      request = {
        command: 'dump_all'
      }

      @connection.with do |conn|
        conn.send_and_read(request)
      end
    end

    def dumps
      request = {
        command: 'dumps'
      }

      @connection.with do |conn|
        conn.send_and_read(request)
      end
    end

    def load(name)
      request = {
        command: 'load',
        tree_name: name
      }

      @connection.with do |conn|
        conn.send_and_read(request)
      end
    end

    def increment(**args)
      request = {
        command: 'increment',
        tree_name: @tree_name
      }.merge!(args)

      @connection.with do |conn|
        conn.send_and_read(request)
      end
    end

    def decrement(**args)
      request = {
        command: 'decrement',
        tree_name: @tree_name
      }.merge!(args)

      @connection.with do |conn|
        conn.send_and_read(request)
      end
    end

    def sum(**args)
      request = {
        command: 'sum',
        tree_name: @tree_name
      }.merge!(args)

      @connection.with do |conn|
        conn.send_and_read(request)
      end
    end

    def find(**args)
      request = {
        command: 'find',
        tree_name: @tree_name
      }.merge!(args)

      @connection.with do |conn|
        conn.send_and_read(request)
      end
    end

    def reset(**args)
      request = {
        command: 'reset',
        tree_name: @tree_name,
      }.merge!(args)

      @connection.with do |conn|
        conn.send_and_read(request)
      end
    end

    def delete(**args)
      request = {
        command: 'delete',
        tree_name: @tree_name,
      }.merge!(args)

      @connection.with do |conn|
        conn.send_and_read(request)
      end
    end
  end
end
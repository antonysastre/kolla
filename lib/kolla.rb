# frozen_string_literal: true

require 'logger'

# Kolla parses a file and reports matching results.
module Kolla
  class << self
    attr_accessor :logger
  end

  self.logger = Logger.new($stdout)

  def self.run(args = [])
    if !args[0].nil?
      model_name = args[0]
      puts Parser.new(options:{model_name:}).run!
    else
      puts Parser.new.run!
    end
  end
end

require 'kolla/parser'
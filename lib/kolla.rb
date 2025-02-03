# frozen_string_literal: true

# Kolla parses a file and reports matching results.
module Kolla
  DEFAULT_FILE = 'db/schema.rb'

  def self.run(file_path = DEFAULT_FILE)
    absolute_path = File.expand_path(file_path)

    unless File.exist?(absolute_path)
      puts "File #{file_path} not found"
      return
    end

    parser = Parser.new(absolute_path)
    puts parser.process
  end
end

require 'kolla/parser'
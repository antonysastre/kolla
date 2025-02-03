# frozen_string_literal: true

module Kolla
  class Parser
    def initialize(file_path)
      @file_path = file_path
    end

    def process
      content = File.read(file_path)
      matches = content.scan(/create_table\s+"(\w+)"/)
      matches.map(&:first)
    rescue Errno::ENOENT
      raise "Schema file_path not found at #{file_path}"
    end

    private

    attr_reader :file_path
  end
end

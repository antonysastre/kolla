# frozen_string_literal: true

module Kolla
  class Parser
    DEFAULT_FILE = File.join('db', 'schema.rb').freeze

    def initialize(file_path: DEFAULT_FILE, options: {})
      @file_path = File.expand_path(file_path)
      @options = options
    end

    def run!
      content = File.read(file_path)
      if options[:model_name]
        extract_fields(content, options[:model_name])
      else
        extract_tables(content)
      end
    rescue Errno::ENOENT
      Kolla.logger.warn "Schema file_path not found at #{file_path}"
    end

    private

    def extract_tables(schema)
      matches = schema.scan(/create_table\s+"(\w+)"/)
      matches.map(&:first).reject { |table| table.start_with?('action_', 'active_') }
    end

    def extract_fields(schema, table_name)
      table_regex = /create_table "#{table_name}".*?do \|t\|(.*?)end/m
      match = schema.match(table_regex)
      return [] unless match

      field_regex = /t\.(\w+)\s+"(\w+)"/
      match[1].scan(field_regex).map { |type, name| "#{name} (#{type})" }
    end

    attr_reader :file_path, :options
  end
end

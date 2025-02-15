require "minitest/autorun"
require "kolla"

class KollaTest < Minitest::Test

  def test_missing_file
    Kolla.logger.stub(:warn, nil) do
      assert_nil Kolla.run(file_path: "not/exists")
    end
  end

  def test_schema_parsing
    result = Kolla::Parser.new(file_path: 'test/fixtures/schema.rb').run!
    assert_equal ["users", "posts"], result
  end

  def test_options_parsing
    result = Kolla::Parser.new(file_path: 'test/fixtures/schema.rb', options: { model_name: 'users' } ).run!
    assert_equal ["name (string)", "life_in_seconds (bigint)", "created_at (datetime)"], result
  end

  def test_ignore_pattern
    result = Kolla::Parser.new(file_path: 'test/fixtures/schema.rb').run!
    refute_includes result, "action_text"
    refute_includes result, "active_storage_blobs"
  end
end
require "minitest/autorun"
require "kolla"

class KollaTest < Minitest::Test
  def test_missing_file
    assert_nil Kolla.run('not/exists')
    assert_nil Kolla.run
  end

  def test_schema_parsing
    result = Kolla::Parser.new('test/fixtures/schema.rb').process
    assert_equal ["users", "posts"], result
  end

  def test_ignore_pattern
    result = Kolla::Parser.new('test/fixtures/schema.rb').process
    refute_includes result, "action_text"
    refute_includes result, "active_storage_blobs"
  end
end
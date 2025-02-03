require "minitest/autorun"
require "kolla"

class KollaTest < Minitest::Test
  def test_missing_file
    assert_nil Kolla.run('not/exists')
    assert_nil Kolla.run
  end

  def test_schema_parsing
    result = Kolla.run('test/fixtures/schema.rb')
    assert_equal ["users", "posts"], result
  end
end
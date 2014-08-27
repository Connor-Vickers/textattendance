require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save without value" do
    record = Record.new
	assert_not record.save
  end
end
# todo test get, create, and create

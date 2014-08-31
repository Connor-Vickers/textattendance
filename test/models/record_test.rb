require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  
  record = Record.new

  test "shouldn't create empty record" do 
	assert_not record.save 
  end
  
  test "shouldn't create record with no student" do 
	assert record.errors.messages[:student][0] == "can't be blank" 
  end
  
  test "shouldn't create record with no meeting" do 
	assert record.errors.messages[:meeting][0] == "can't be blank"
  end
  
  test "shouldn't create record with no value" do 
	assert record.errors.messages[:value][0] == "can't be blank"
  end
  
  test "should associate record and student" do 
	assert records(:one)[:student_id] == students(:one)[:id]
  end
  
  test "should associate record and meeting" do 
	assert records(:one)[:meeting_id] == meetings(:one)[:id]
  end
  
  test "shouldn't create un-unique record" do 
    record[:student_id] = records(:one)[:student_id]
	record[:meeting_id] = records(:one)[:meeting_id]
	record.save
	assert record.errors.messages[:student][0] == "has already been taken"
  end
end

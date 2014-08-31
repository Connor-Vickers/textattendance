require 'test_helper'

class MeetingTest < ActiveSupport::TestCase

meeting = Meeting.new

  test "shouldn't create empty meeting" do 
	assert_not meeting.save 
  end
  
  test "shouldn't create meeting with no course" do 
	assert meeting.errors.messages[:course][0] == "can't be blank"
  end
  
  test "shouldn't create meeting with no name" do 
	assert meeting.errors.messages[:name][0] == "can't be blank"
  end
  
  test "shouldn't create meeting with no when" do 
	assert meeting.errors.messages[:when][0] == "can't be blank"
  end
  
  test "shouldn't create meeting with same auth" do 
    meeting[:auth] = meetings(:valid)[:auth]
	meeting.save
	assert meeting.errors.messages[:auth][0] == "has already been taken"
  end
  
  test "should associate  meeting and course" do 
	assert meetings(:valid)[:course_id] == courses(:course_1)[:id]
  end
  
  test "should allow nil auth" do 
    meeting[:auth] = nil
	meeting.save
	assert_not meeting.errors.messages.has_key? :auth
  end
  
  test "should allow multiple nil auth" do 
    first = meetings :one
    first[:auth] = nil
	assert first.save
	second = meetings :two
    second[:auth] = nil
	assert second.save
  end
  
  test "should destroy dependent records if destroyed" do
    to_destroy = meetings :to_destroy
	
    before = Record.where(meeting: to_destroy).length
	assert(before > 0, "no records with meeting :to_destroyed exist
	before destroying record")
	
	to_destroy.destroy
	
	after = Record.where(meeting: to_destroy).length
	assert(after == 0, 
	"dependent records where not destroyed when meeting was") 
  end
end

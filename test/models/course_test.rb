require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  course = Course.new
  
  test "shouldn't create empty course" do 
	assert_not course.save 
  end
  
  test "should associate course and meetings" do 
	assert courses(:one).meetings.length > 0
  end
  
  test "should associate course and students" do 
	assert courses(:one).students.length > 0
  end
  
  test "should destroy dependent students and meetings if destroyed" do
    to_destroy = courses :to_destroy
	
    before = Meeting.where(course: to_destroy).length
	assert(before > 0, "no meeting with course :to_destroyed exist
	before destroying record")
	
	before = Student.where(course: to_destroy).length
	assert(before > 0, "no student with course :to_destroyed exist
	before destroying record")
	
	to_destroy.destroy
	
	meetings_after = Meeting.where(course: to_destroy).length
	assert(meetings_after == 0, 
	"dependent meetings were not destroyed when course was")

    students_after = Student.where(course: to_destroy).length
	assert(students_after == 0, 
	"dependent students where not destroyed when course was") 	
  end
  
end


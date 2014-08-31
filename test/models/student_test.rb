require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  student = Student.new

  test "shouldn't create empty student" do 
	assert_not student.save 
  end
  
  test "shouldn't create student with no course" do 
	assert student.errors.messages[:course][0] == "can't be blank"
  end
  
  test "shouldn't create student with no first name" do 
	assert student.errors.messages[:first][0] == "can't be blank"
  end
  
  test "shouldn't create student with no last name" do 
	assert student.errors.messages[:last][0] == "can't be blank"
  end
  
  test "shouldn't create student with no number" do 
	assert student.errors.messages[:number][0] == "can't be blank"
  end
  
  test "shouldn't create student with same number and course" do 
    student[:number] = students(:one)[:number]
	student[:course_id] = students(:one)[:course_id]
	student.save
	assert student.errors.messages[:number][0] == "has already been taken"
  end
  
  test "should associate student and course" do 
	assert students(:one)[:course_id] == courses(:one)[:id]
  end
  
  test "should associate student and record" do 
	assert students(:one).records.length == 3
  end
  
  test "should destroy dependent records if destroyed" do
    to_destroy = students :to_destroy
	
    before = Record.where(student: to_destroy).length
	assert(before > 0, 
	"no records with student: :to_destroy exist before destroying record")
	
	to_destroy.destroy
	
	after = Record.where(student: to_destroy).length
	assert(after == 0, 
	"dependent records where not destroyed when student was") 
  end
end

require 'test_helper'

class RecordsControllerTest < ActionController::TestCase
  setup do
    @record = records(:one)
  end
  
  test "should respond to sms in xml" do
    post :update, { Body: "12342", From: "2341234" }
	assert_response :success
	assert_template "response.xml.erb" 
  end
  
  test "should record attendance" do
    post :update, { Body: meetings(:one).auth, From: students(:one)[:number] }
	assert_select "Message","Thank you. Your attendance has been recorded."
	#to do see if update record is successful
  end
  
  test "should respond to invalid code" do
    post :update, { Body: "", From: "" }
	assert_select "Message","That is an invalid or expired code. Please try again."
  end
  
  test "should respond to new student" do
    post :update, { Body: meetings(:one).auth, From: "" }
	assert_select "Message","What is your official first name?"
	assert cookies[:meeting_id] == meetings(:one).id, "didn't set meeting_id cookie correctly"
  end
  
  test "should respond if given first name" do
    @request.cookies[:meeting_id] = meetings(:one).id
    post :update, { Body: "first name", From: "" }
	assert_select "Message","What is your official last name?"
	assert cookies[:first] == "first name", "didn't set first cookie correctly"
  end
  
  test "should respond if given last name" do
    @request.cookies[:meeting_id] = meetings(:one).id
	@request.cookies[:first] = "first name"
    post :update, { Body: "last name", From: "" }
	assert_select "Message","Thank you. Your attendance has been recorded."
	assert cookies[:meeting_id] == nil
	assert cookies[:first] == nil
	#to do see if created student
	#to do see if update record is successful
  end

end

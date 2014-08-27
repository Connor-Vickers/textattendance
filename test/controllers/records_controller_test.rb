require 'test_helper'

class RecordsControllerTest < ActionController::TestCase
  setup do
    @record = records(:one)
  end

 # test "should update record" do
 #   patch :update, id: @record, record: { value: @record.value, meeting_id: @record.meeting_id, student_id: @record.student_id }
 #   assert_redirected_to record_path(assigns(:record))
 # end

end

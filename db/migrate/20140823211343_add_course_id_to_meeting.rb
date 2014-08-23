class AddCourseIdToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :course_id, :integer
  end
end

class AddMeetingIdStudentIdToRecord < ActiveRecord::Migration
  def change
    add_column :records, :meeting_id, :integer
    add_column :records, :student_id, :integer
  end
end

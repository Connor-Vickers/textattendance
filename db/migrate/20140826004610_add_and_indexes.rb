class AddAndIndexes < ActiveRecord::Migration
  def change
    add_index :records, [:student_id, :meeting_id], unique:true
	add_index :meetings, :course_id
  end
end

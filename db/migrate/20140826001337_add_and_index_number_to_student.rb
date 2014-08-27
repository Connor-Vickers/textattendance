class AddAndIndexNumberToStudent < ActiveRecord::Migration
  def change
    add_column :students, :number, :integer
	add_index :students, [:number, :course_id], unique:true
  end
end

class CourseRenameNameColumn < ActiveRecord::Migration
  def change
    rename_column :courses, :Name, :name
  end
end

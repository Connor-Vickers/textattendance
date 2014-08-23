class StudentRenameNameColumn < ActiveRecord::Migration
  def change
    rename_column :students, :Name, :name
  end
end

class AddFirstLastToStudentDeleteName < ActiveRecord::Migration
  def change
    add_column :students, :first, :string
    add_column :students, :last, :string
	remove_column :students, :name, :string
  end
end

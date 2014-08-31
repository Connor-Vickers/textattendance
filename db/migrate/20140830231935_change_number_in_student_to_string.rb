class ChangeNumberInStudentToString < ActiveRecord::Migration
  def change
    change_column :students, :number, :string
  end
end

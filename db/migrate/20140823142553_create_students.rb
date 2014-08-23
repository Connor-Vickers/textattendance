class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :Name

      t.timestamps
    end
  end
end

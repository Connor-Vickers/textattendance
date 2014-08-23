class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :Name

      t.timestamps
    end
  end
end

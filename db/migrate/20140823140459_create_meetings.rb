class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :Name

      t.timestamps
    end
  end
end

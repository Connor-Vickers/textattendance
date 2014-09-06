class ChangetypeWhenInMeeting < ActiveRecord::Migration
  def change
    remove_column :meetings, :when, :datetime
	add_column :meetings, :when, :string
  end
end

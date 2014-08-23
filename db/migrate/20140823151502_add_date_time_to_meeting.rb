class AddDateTimeToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :when, :datetime
  end
end

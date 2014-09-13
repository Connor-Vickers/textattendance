class MeetingRenamenameColumn < ActiveRecord::Migration
  def change
    rename_column :meetings, :Name, :name
  end
end

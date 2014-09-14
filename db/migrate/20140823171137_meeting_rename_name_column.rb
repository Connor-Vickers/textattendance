class MeetingRenamenameColumn < ActiveRecord::Migration
  def change
    rename_column :meetings, :Name, :name#may fail change :name to :name but couldn't remigrate
  end
end

class MeetingRenamenameColumn < ActiveRecord::Migration
  def change
    rename_column :meetings, :name, :name
  end
end

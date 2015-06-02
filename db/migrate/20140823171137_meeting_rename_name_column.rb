class MeetingRenameNameColumn < ActiveRecord::Migration
  def change
    rename_column :meetings, :Name, :name
  end
end

class AddAuthToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :auth, :integer, null: :true, unique: :true
  end
end

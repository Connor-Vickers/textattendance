class AddIndexAuthToMeeting < ActiveRecord::Migration
  def change
    add_index :meetings, :auth, unique: :true
  end
end

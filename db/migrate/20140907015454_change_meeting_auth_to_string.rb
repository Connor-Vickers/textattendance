class ChangeMeetingAuthToString < ActiveRecord::Migration
  def change
    remove_column :meetings, :auth, :integer
	add_column :meetings, :auth, :string
  end
end

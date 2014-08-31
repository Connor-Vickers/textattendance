class ChangeValueInRecordToInteger < ActiveRecord::Migration
  def change
    remove_column :records, :value, :integer
	add_column :records, :value, :integer
  end
end

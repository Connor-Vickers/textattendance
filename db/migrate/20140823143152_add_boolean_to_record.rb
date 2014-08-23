class AddBooleanToRecord < ActiveRecord::Migration
  def change
    add_column :records, :value, :boolean
  end
end

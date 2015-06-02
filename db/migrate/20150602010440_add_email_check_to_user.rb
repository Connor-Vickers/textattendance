class AddEmailCheckToUser < ActiveRecord::Migration
  def change
    add_column :users, :email_check, :string
  end
end

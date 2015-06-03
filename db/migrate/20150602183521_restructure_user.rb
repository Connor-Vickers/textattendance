class RestructureUser < ActiveRecord::Migration
  def change
        rename_column :users, :email_check, :auth_token
        add_column :users, :locked, :boolean
        add_column :users, :email_needs_validated, :boolean
        add_column :users, :password_needs_reset, :boolean
  end
end

class AddPaddwordColumnToUser < ActiveRecord::Migration[6.0]
  def change
  	rename_column :Users, :password, :password_digest
  end
end

class AddForeignKeysToComment < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments, :Users
    add_foreign_key :comments, :Posts
  end
end

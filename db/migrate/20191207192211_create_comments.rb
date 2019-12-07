class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :user_id
      t.string :parent_id
      t.string :post_id
      t.text :content

      t.timestamps
    end
  end
end

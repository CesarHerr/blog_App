class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false
      t.timestamps
    end
    add_foreign_key :likes, :users, column: :user_id
    add_foreign_key :likes, :posts, column: :post_id
  end
end

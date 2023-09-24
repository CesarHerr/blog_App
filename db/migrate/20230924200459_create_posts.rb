class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :author_id, null: false
      t.string :title, null: false, limit: 50
      t.text :text, null: false
      t.integer :likes_count, null: false, default: 0
      t.integer :comments_count, null: false, default: 0
      t.timestamps
    end

    add_foreign_key :posts, :users, column: :author_id
  end
end

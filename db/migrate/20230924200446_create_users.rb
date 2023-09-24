class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 50
      t.binary :photo, null: false
      t.text :bio, null: false
      t.integer :posts_count, null: false, default: 0
      t.timestamps
    end
  end
end

class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text  :title, null: false
      t.text    :body, null: false
      t.integer :category_id, null: false
      t.integer :poster_id, null: false
      t.integer :commentable_id
      t.string  :commentable_type
      t.timestamps
    end
  end
end

class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :user_id
      t.text :text_post

      t.timestamps
    end
  end
end

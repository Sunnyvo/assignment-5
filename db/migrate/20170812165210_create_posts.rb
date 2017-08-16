class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :poster_id
      t.text :body
      t.string :waller_id
      t.timestamps
    end
  end
end

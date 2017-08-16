class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.string :post_id
      t.string :body

      t.timestamps
    end
  end
end

class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :keywords
      t.text :body
      t.string :featured_image
      t.timestamps
    end
  end
end

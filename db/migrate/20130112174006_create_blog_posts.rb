class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.text :body
      t.string :title
      t.integer :admin_id
      t.attachment :image

      t.timestamps
    end
  end
end

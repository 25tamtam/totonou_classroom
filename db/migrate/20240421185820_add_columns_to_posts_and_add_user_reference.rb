class AddColumnsToPostsAndAddUserReference < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :title, :string
    add_column :posts, :age, :integer
    add_column :posts, :detail, :text
    add_column :posts, :image1, :string
    add_column :posts, :image2, :string
    add_column :posts, :advice, :text
    add_reference :posts, :user, foreign_key: true
  end
end

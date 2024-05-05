class RemoveAdviceFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :advice, :string
  end
end
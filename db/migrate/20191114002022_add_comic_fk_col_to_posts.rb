class AddComicFkColToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :comic, foreign_key: true
  end
end

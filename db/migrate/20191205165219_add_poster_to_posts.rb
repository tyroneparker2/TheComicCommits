class AddPosterToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :poster, :string
  end
end
